Pod::Spec.new do |s|
s.name = 'WYCloudMusicPhoto'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = 'An Animate Water view on iOS.'
s.homepage = 'https://github.com/liuluchang/WYCloudMusicPhoto'
s.authors = { 'liuluchang' => 'cqllc.123@qq.com' }
s.source = { :git => 'https://github.com/liuluchang/WYCloudMusicPhoto.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'WYMusicPhoto/*.{h,m}'
s.resources = 'WYMusicPhoto/*.{png,xib}'
end
