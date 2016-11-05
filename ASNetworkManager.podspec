Pod::Spec.new do |s|
  s.name             = 'ASNetworkManager'
  s.version          = '0.0.4'
  s.summary          = 'An Easy way to Call REST APIs'
  s.dependency 'SwiftyJSON'

  s.author           = { 'Apoorv Suri' => 'apoorvsuri2012@gmail.com' }
  s.source           = { :git => 'https://github.com/ApoorvSuri/ASNetworkManager.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0.0'
  s.source_files = 'ASNetworkManager/NetworkManager.swift'
  s.description      = <<-DESC
The Network Manager uses the default Cocoa Network Utility To make REST API calls.
                       DESC
  s.homepage         = 'https://github.com/ApoorvSuri/ASNetworkManager'
  s.license          = { :type => 'MIT', :text => <<-LICENSE
                   Copyright 2012
                   Permission is granted to...
                 LICENSE
               }
end