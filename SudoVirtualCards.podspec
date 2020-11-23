#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoVirtualCards'
  spec.version               = '9.1.3'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'Virtual Cards SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0',  :file => 'LICENSE' }

  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-virtual-cards-ios.git', :tag => "v#{spec.version}" }
  spec.source_files          = 'SudoVirtualCards/**/*.swift'
  spec.ios.deployment_target = '13.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.0'

  spec.dependency 'AWSAppSync', '~> 3.1'
  spec.dependency 'Stripe', '~> 20.1'
  spec.dependency 'SudoUser', '~> 7.14'
  spec.dependency 'SudoProfiles', '~> 5.6'
  spec.dependency 'SudoLogging', '~> 0.3'
  spec.dependency 'SudoKeyManager', '~> 1.2'
  spec.dependency 'SudoOperations', '~> 3.3'
  spec.dependency 'SudoApiClient', '~> 1.4'
end
