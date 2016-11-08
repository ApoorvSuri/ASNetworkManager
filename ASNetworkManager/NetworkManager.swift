//
//  NetworkManager.swift
//  ASNetworkManager
//
//  Created by Apoorv Suri on 31/10/16.
//  Copyright © 2016 Apoorv Suri. All rights reserved.
//

import Foundation
import SwiftyJSON

class NetworkManager {
    
    //---------------------------------------------------------------------
    //MARK: SUCCESS & FAILURE CLOSURES
    //---------------------------------------------------------------------
    
    internal typealias WebServiceSuccess = (_ json : JSON) -> Void
    internal typealias WebServiceFailure = (_ error : Error?) -> Void
    
    class func performNetworkRequest(URLString : String
        , method : String
        , parameters : [String : Any]
        , successBlock : @escaping WebServiceSuccess
        , failureBlock : @escaping WebServiceFailure)  {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL.init(string: URLString)
        
        var urlRequest = URLRequest.init(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        urlRequest.httpMethod = method
        
        let configuration  = URLSessionConfiguration.default
        
        let session : URLSession = URLSession.init(configuration: configuration
            , delegate: nil
            , delegateQueue: OperationQueue.main)
        
        do {
            
            let json = try JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.httpBody = json
            
        } catch let error {
            
            print("#Warning : ASNetworkManager - Error Attaching Parameters \(error.localizedDescription)")
            
        }
        
        
        let dataTask = session.dataTask(with: urlRequest
            , completionHandler:{
                
                data,response,error in
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                if error != nil {
                    
                    OperationQueue.main.addOperation({
                        
                        failureBlock(error!)
                        
                    })
                } else {
                    
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    
                    if statusCode != 200 {
                        
                        print("#Warning : ASNetworkManager - Invalid Status Code \(statusCode)")
                        
                        failureBlock(error!)
                        
                    } else {
                        
                        OperationQueue.main.addOperation({
                            
                            do {
                                
                                let parsedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                                
                                successBlock(JSON(parsedData))
                                
                            } catch let error {
                                
                                print("#Warning : ASNetworkManager - Error Reading Data : \(error.localizedDescription)")
                            }
                        })
                    }
                }
        })
        
        dataTask.resume()
    }
}
