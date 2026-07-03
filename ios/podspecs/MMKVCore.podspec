Pod::Spec.new do |s|
  s.name = 'MMKVCore'
  s.version = '2.2.2'
  s.summary = 'MMKVCore for MMKV. MMKV is a cross-platform key-value storage framework developed by WeChat.'
  s.description = "Don't use this library directly. Use MMKV instead."
  s.homepage = 'https://github.com/Tencent/MMKV'
  s.license = { :type => 'BSD 3-Clause', :file => 'LICENSE.TXT' }
  s.authors = { 'guoling' => 'guoling@tencent.com' }
  s.platforms = { :ios => '13.0', :osx => '10.15', :tvos => '13.0', :watchos => '6.0', :visionos => '1.0' }
  s.source = { :http => 'https://github.com/Tencent/MMKV/archive/refs/tags/v2.2.2.tar.gz' }
  s.source_files = ['Core', 'Core/*.{h,cpp,hpp}', 'Core/aes/*', 'Core/aes/openssl/*', 'Core/crc32/*.h']
  s.public_header_files = ['Core/MMBuffer.h', 'Core/MMKV.h', 'Core/MMKVLog.h', 'Core/MMKVPredef.h', 'Core/MiniPBCoder.h', 'Core/PBUtility.h', 'Core/ScopedLock.hpp', 'Core/ThreadLock.h', 'Core/aes/openssl/openssl_md5.h', 'Core/aes/openssl/openssl_opensslconf.h']
  s.compiler_flags = '-x objective-c++'
  s.requires_arc = ['Core/MemoryFile.cpp', 'Core/ThreadLock.cpp', 'Core/InterProcessLock.cpp', 'Core/MMKVLog.cpp', 'Core/PBUtility.cpp', 'Core/MemoryFile_OSX.cpp', 'aes/openssl/openssl_cfb128.cpp', 'aes/openssl/openssl_aes_core.cpp', 'aes/openssl/openssl_md5_one.cpp', 'aes/openssl/openssl_md5_dgst.cpp', 'aes/AESCrypt.cpp']
  s.frameworks = 'CoreFoundation'
  s.ios.frameworks = 'UIKit'
  s.libraries = ['z', 'c++']
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++20',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'NO',
    'GCC_PREPROCESSOR_DEFINITIONS[config=Release]' => '$(inherited) NDEBUG=1'
  }
end
