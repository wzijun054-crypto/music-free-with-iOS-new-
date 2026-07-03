Pod::Spec.new do |s|
  source_path = File.expand_path('../../vendor/pod-sources/fmt-6.2.1.tar.gz', __dir__)
  s.name = 'fmt'
  s.version = '6.2.1'
  s.summary = '{fmt} is an open-source formatting library for C++.'
  s.description = 'Formatting library for C++.'
  s.homepage = 'https://github.com/fmtlib/fmt'
  s.license = { :type => 'MIT' }
  s.authors = { 'Hien Nguyen' => 'hien.nguyenle.it@gmail.com' }
  s.source = { :http => "file://#{source_path}" }
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/include',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
    'USE_HEADERMAP' => 'NO',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO'
  }
  s.platforms = { :ios => '10.0', :osx => '10.14' }
  s.libraries = 'c++'
  s.source_files = ['src/*.cc', 'include/**/*.{hpp,h}']
  s.public_header_files = 'include/**/*.{hpp,h}'
  s.exclude_files = 'src/os.cc'
  s.header_mappings_dir = 'include'
  s.preserve_paths = 'include'
end
