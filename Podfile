#
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'

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
end

target 'SudoVirtualCardsTests' do
  inherit! :search_paths
  podspec :name => 'SudoVirtualCards'
end

target 'SudoVirtualCardsIntegrationTests' do
  inherit! :search_paths
  podspec :name => 'SudoVirtualCards'
  pod 'SudoIdentityVerification', '~> 4.0'
  pod 'SudoVirtualCardsSimulator', '~> 2.1'
end

# Fix Xcode nagging warning on pod install/update
post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = 'YES'
  end
end
