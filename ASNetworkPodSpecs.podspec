Pod::Spec.new do |s|

# 1
s.platform = :ios

s.ios.deployment_target = 9.0

s.name = "ASNetworkPodSpecs"
s.summary = "ASNetworkManager is a network request handler"
s.requires_arc = true

# 2
s.version = "0.0.1"



# 4 - Replace with your name and e-mail address
s.author = { "Apoorv Suri" => "apoorvsuri2012@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/ApoorvSuri/ASNetworkManager"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/ApoorvSuri/ASNetworkManager.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"
s.dependency 'SwiftyJSON'

# 8
s.source_files = "ASNetworkManager/**/*.{swift}"

# 9
s.resources = "ASNetworkManager/**/*.{png,jpeg,jpg,storyboard,xib}"
end
