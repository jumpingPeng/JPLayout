Pod::Spec.new do |s|
s.name         = 'JPLayout'
s.version      = '0.0.1'
s.summary      = 'An another way  to-layout'
s.homepage     = 'https://github.com/jumpingPeng/JPLayout'
s.license            = { :type => "MIT", :file => "LICENSE" }
s.authors      = {'JUMPING' => 'jumpingjump@163.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/jumpingPeng/JPLayout.git', :tag => s.version}
s.source_files = 'JPLayout/**/*.{h,m}'
#s.resource     = 'JPLayout/JPLayout.bundle'
s.requires_arc = true
end
