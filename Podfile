source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '16.0'

workspace 'SudoVirtualCards'
use_frameworks!
inhibit_all_warnings!

project 'SudoVirtualCards', {
  'Debug-Dev' => :debug,
  'Debug-QA' => :debug,
  'Debug-Prod' => :debug,
  'Release-Dev' => :release,
  'Release-QA' => :release,
  'Release-Prod' => :release
}

target 'SudoVirtualCards' do
  inherit! :search_paths
  podspec :name => 'SudoVirtualCards'

  target 'SudoVirtualCardsTests' do
    podspec :name => 'SudoVirtualCards'
  end

  target 'SudoVirtualCardsIntegrationTests' do
    podspec :name => 'SudoVirtualCards'
    pod 'Stripe', '~> 23'
    pod 'Frames', '~> 3'
    pod 'SudoProfiles', '~> 18.0'
    pod 'SudoEntitlements', '~> 11.0'
    pod 'SudoEntitlementsAdmin', '~> 6.0'
    pod 'SudoIdentityVerification', '~> 16.0'
    pod 'SudoVirtualCardsSimulator', '~> 11.0'
  end
end

target 'SudoVirtualCardsNotificationExtension' do
  inherit! :search_paths
  podspec :name => 'SudoVirtualCardsNotificationExtension'
  
  target 'SudoVirtualCardsNotificationExtensionTests'
  target 'TestExtensionApp'
end


# Fix Xcode nagging warning on pod install/update
post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = 'YES'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
        xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
        File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
      end
    end
  end
end
