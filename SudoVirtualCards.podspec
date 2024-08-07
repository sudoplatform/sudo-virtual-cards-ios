#
Pod::Spec.new do |spec|
  spec.name                  = 'SudoVirtualCards'
  spec.version               = '24.1.2'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com'

  spec.summary               = 'Virtual Cards SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0',  :file => 'LICENSE' }

  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-virtual-cards-ios.git', :tag => "v#{spec.version}" }
  spec.source_files          = 'SudoVirtualCards/**/*.swift'
  spec.ios.deployment_target = '15.0'
  spec.requires_arc          = true
  spec.swift_version         = '5.0'

  spec.dependency 'AWSAppSync', '~> 3.6.1'
  spec.dependency 'AWSCore', '~> 2.27.15'
  spec.dependency 'Starscream', '4.0.4'  # 4.0.5+ breaks AWSAppSync
  spec.dependency 'SudoUser', '~> 15.1'
  spec.dependency 'SudoLogging', '~> 1.0'
  spec.dependency 'SudoKeyManager', '~> 2.5'
  spec.dependency 'SudoApiClient', '~> 10.1.0'
  spec.dependency 'SudoConfigManager', '~> 3.0.2'
end
