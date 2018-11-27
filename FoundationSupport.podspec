Pod::Spec.new do |s|
  s.name         = 'FoundationSupport'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/sora0077/FoundationSupport'
  s.authors      = { 'sora0077' => 't.hayashi0077+github@gmail.com' }
  s.summary      = 'Foundation Utilities'
  s.source       = { :git => 'https://github.com/sora0077/FoundationSupport.git', :tag => s.version.to_s }

  s.source_files = ['Sources/Swift/*.swift', 'Sources/Foundation/*.swift', 'Sources/CommonCrypto.swift']
  s.framework    = 'Foundation'
  
  s.ios.deployment_target = "10.0"
end
