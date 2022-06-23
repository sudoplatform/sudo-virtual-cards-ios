#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoVirtualCards'
  spec.version               = '18.0.2'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'Virtual Cards SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0',  :file => 'LICENSE' }

  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-virtual-cards-ios.git', :tag => "v#{spec.version}" }
  spec.source_files          = 'SudoVirtualCards/**/*.swift'
  spec.ios.deployment_target = '14.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.0'

  spec.dependency 'SudoUser', '~> 13.0'
  spec.dependency 'SudoLogging', '~> 0.3'
  spec.dependency 'SudoKeyManager', '~> 1.2'
  spec.dependency 'SudoApiClient', '~> 8.0'
end
