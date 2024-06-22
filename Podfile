source 'https://cdn.cocoapods.org/'

workspace 'Trainer'
project 'Trainer.xcodeproj'

use_frameworks!
inhibit_all_warnings!
install! 'cocoapods', :disable_input_output_paths => true

platform :ios, '15.0'

load './scripts/podfile/external_libs.rb'
load './scripts/podfile/load_libs.rb'

CoreDependencyInjector()

post_install do |installer|9
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
          config.build_settings['GCC_WARN_ABOUT_RETURN_TYPE'] = 'YES'
      end
  end
end
