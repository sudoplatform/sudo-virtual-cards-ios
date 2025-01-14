#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoVirtualCardsNotificationExtension'
  spec.version               = '26.2.0'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'VirtualCards SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0',  :file => 'LICENSE' }

  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-virtual-cards-ios.git', :tag => "v#{spec.version}" }
  spec.ios.deployment_target = '15.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.7'

  spec.source_files = 'SudoVirtualCardsCommon/**/*.swift','SudoVirtualCardsNotificationExtension/**/*.swift'

  spec.dependency 'SudoLogging', '~> 1.0'
  spec.dependency 'SudoNotificationExtension', '~> 3.0'
end