#source 'https://github.com/CocoaPods/Specs.git'
platform :ios ,'12.0'
use_frameworks!
inhibit_all_warnings!

def analytics
  
end

def network
  pod 'Alamofire', '5.4.1'
end

def database
  
end

def utilities
  
end

def codeFormat
  pod 'SwiftLint', '0.42.0'
  pod 'SwiftFormat/CLI', '0.47.11'
end

def testing_pods
  
end

def shared_pods
  analytics
  network
  database
  utilities
  codeFormat
end

target 'NutritionAnalysis' do
  shared_pods
end


target 'NutritionAnalysisTests' do
  inherit! :search_paths
  testing_pods
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['SWIFT_VERSION'] = '5.3.0'
  end
end
