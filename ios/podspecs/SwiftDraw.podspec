Pod::Spec.new do |s|
  source_path = File.expand_path('../../vendor/pod-sources/SwiftDraw-0.21.0.tar.gz', __dir__)
  s.name = 'SwiftDraw'
  s.version = '0.21.0'
  s.summary = 'A Swift library that adds support for SVG files to UIImage and NSImage.'
  s.homepage = 'https://github.com/swhitty/SwiftDraw'
  s.authors = 'Simon Whitty'
  s.license = { :type => 'zlib', :file => 'LICENSE.txt' }
  s.source = { :http => "file://#{source_path}" }
  s.platforms = { :ios => '13.0', :osx => '10.15', :tvos => '13.0', :watchos => '6.0' }
  s.source_files = 'SwiftDraw/**/*.swift'
  s.ios.exclude_files = 'SwiftDraw/NSImage+Image.swift'
  s.ios.frameworks = ['UIKit', 'Foundation']
  s.osx.exclude_files = 'SwiftDraw/UIImage+Image.swift'
  s.osx.frameworks = ['AppKit', 'Foundation']
  s.tvos.exclude_files = 'SwiftDraw/NSImage+Image.swift'
  s.tvos.frameworks = ['UIKit', 'Foundation']
  s.watchos.exclude_files = 'SwiftDraw/NSImage+Image.swift'
  s.watchos.frameworks = ['UIKit', 'WatchKit', 'Foundation']
  s.swift_version = '5.0'
end
