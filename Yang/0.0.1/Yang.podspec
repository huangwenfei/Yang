Pod::Spec.new do |s|
  s.name = 'Yang'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Auot Layout DSL library.'
  s.homepage = 'https://github.com/huangwenfei/Yang'
  s.authors = { '黄文飞' => 'yi.yuan.zi@163.com' }
  s.source = { :git => 'https://github.com/huangwenfei/Yang.git', :tag => s.version }

  s.ios.deployment_target = '12.0'
  
  s.swift_versions = ['5']

  s.source_files = 'Sources/**/*.swift'

  s.resource_bundles = {'Yang' => ['Sources/Privacy/PrivacyInfo.xcprivacy']}
end
