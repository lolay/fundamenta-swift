Pod::Spec.new do |s|
  s.name = 'LolayFundamenta'
  s.version = '5.0'
  s.license = {:type => 'Apache License, Version 2.0', :file => 'LICENSE'}
  s.summary = 'Lolay Foundation'
  s.homepage = 'https://github.com/lolay/fundamenta-swift'
  s.authors = { 'Lolay, Inc.' => 'info@lolay.com' }
  s.source = { :git => 'https://github.com/lolay/fundamenta-swift.git', :tag => s.version }
  s.swift_version = "5.0"
  s.module_name = "LolayFundamenta"
  s.ios.deployment_target = '16.0'
  s.source_files = 'LolayFundamenta/*.swift'
end
