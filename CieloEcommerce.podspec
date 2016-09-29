Pod::Spec.new do |s|
  s.name             = 'CieloEcommerce'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CieloEcommerce.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DeveloperCielo/API-3.0-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thiago Rodrigues de Paula' => 'thiago.rdp@gmail.com' }
  s.source           = { :git => 'https://github.com/DeveloperCielo/API-3.0-iOS', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CieloEcommerce/Classes/**/*'

  s.dependency 'AFNetworking', '~> 3.1'
  s.dependency 'Mantle', '~> 2.0'
end
