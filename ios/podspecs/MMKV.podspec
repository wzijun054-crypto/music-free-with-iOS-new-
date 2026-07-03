Pod::Spec.new do |s|
  s.name = 'MMKV'
  s.version = '2.2.2'
  s.summary = 'MMKV is a cross-platform key-value storage framework developed by WeChat.'
  s.description = 'The MMKV, for Objective-C.'
  s.homepage = 'https://github.com/Tencent/MMKV'
  s.license = { :type => 'BSD 3-Clause', :file => 'LICENSE.TXT' }
  s.authors = { 'guoling' => 'guoling@tencent.com' }
  s.platforms = { :ios => '13.0', :osx => '10.15', :tvos => '13.0', :visionos => '1.0' }
  s.source = { :http => 'https://github.com/Tencent/MMKV/archive/refs/tags/v2.2.2.tar.gz' }
  s.source_files = ['iOS/MMKV/MMKV', 'iOS/MMKV/MMKV/*.{h,mm,hpp}']
  s.public_header_files = ['iOS/MMKV/MMKV/MMKV.h', 'iOS/MMKV/MMKV/MMKVHandler.h']
  s.frameworks = 'CoreFoundation'
  s.libraries = ['z', 'c++']
  s.requires_arc = false
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++20',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'NO'
  }
  s.dependency 'MMKVCore', '~> 2.2.2'
end
