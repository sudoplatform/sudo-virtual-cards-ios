#
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '15.0'

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
    pod 'Stripe', '~> 22'
    pod 'SudoProfiles', '~> 16.0'
    pod 'SudoEntitlements', '~> 8.0'
    pod 'SudoEntitlementsAdmin', '~> 4.0'
    pod 'SudoIdentityVerification', '~> 13.0'
    pod 'SudoVirtualCardsSimulator', '~> 9.0'
  end

end


# Fix Xcode nagging warning on pod install/update
post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = 'YES'
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
  end
end
