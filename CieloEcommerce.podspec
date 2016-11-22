Pod::Spec.new do |s|
  s.name             = 'CieloEcommerce'
  s.version          = '0.1.1'
  s.summary          = 'SDK de integração com a API 3.0 da Cielo.'

  s.homepage         = 'https://github.com/DeveloperCielo/API-3.0-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/DeveloperCielo/API-3.0-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CieloEcommerce/Classes/**/*'

  s.dependency 'AFNetworking', '~> 3.1'
  s.dependency 'Mantle', '~> 2.0'
end
