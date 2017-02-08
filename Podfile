# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def fakery
    pod 'Fakery'
end

def shared_testing_pods
    pod 'Nimble'
end

abstract_target 'DressMyRunTargets' do
    pod 'Alamofire'
    pod 'PromiseKit/CorePromise'
    pod 'PromiseKit/MessageUI'
    pod 'PromiseKit/UIKit'
    pod 'SwiftyJSON'
    fakery
    
    target 'DressMyRun'
    target 'DressMyRunStaging'
    target 'DressMyRunUITests'
    
    target 'Unit Tests' do
        shared_testing_pods
    end
end

target 'UI Tests' do
    shared_testing_pods
    fakery
end 
