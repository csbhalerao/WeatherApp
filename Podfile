source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'WeatherApp' do
  pod 'GoogleMaps'
  pod 'GooglePlaces'
  pod 'Alamofire', '~> 4.5'
  pod 'ObjectMapper', '~> 2.2'
  pod 'Firebase/Database'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            # these libs work now only with Swift3.2 in Xcode9
            if ['ObjectMapper'].include? target.name
                configuration.build_settings['SWIFT_VERSION'] = "3.2"
            end
        end
    end
end
