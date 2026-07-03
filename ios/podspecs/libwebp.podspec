Pod::Spec.new do |s|
  source_path = File.expand_path('../../vendor/pod-sources/libwebp-1.5.0.tar.gz', __dir__)
  s.name = 'libwebp'
  s.version = '1.5.0'
  s.summary = 'Library to encode and decode images in WebP format.'
  s.homepage = 'https://developers.google.com/speed/webp/'
  s.authors = 'Google Inc.'
  s.license = { :type => 'BSD', :file => 'COPYING' }
  s.source = { :http => "file://#{source_path}" }
  s.compiler_flags = '-D_THREAD_SAFE'
  s.requires_arc = false
  s.platforms = { :osx => '10.11', :ios => '9.0', :tvos => '9.0', :watchos => '2.0', :visionos => '1.0' }
  s.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/' }
  s.default_subspecs = ['sharpyuv', 'webp', 'demux', 'mux']
  s.preserve_paths = 'src'
  s.prepare_command = "sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'"

  s.subspec 'sharpyuv' do |ss|
    ss.preserve_paths = ['src', 'sharpyuv']
    ss.source_files = 'sharpyuv/*.{h,c}'
    ss.public_header_files = 'sharpyuv/sharpyuv.h'
  end

  s.subspec 'webp' do |ss|
    ss.dependency 'libwebp/sharpyuv'
    ss.source_files = ['src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h', 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/dec/*.{h,c}', 'src/enc/*.{h,c}']
    ss.public_header_files = ['src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h']
  end

  s.subspec 'demux' do |ss|
    ss.dependency 'libwebp/webp'
    ss.source_files = ['src/demux/*.{h,c}', 'src/webp/demux.h']
    ss.public_header_files = 'src/webp/demux.h'
  end

  s.subspec 'mux' do |ss|
    ss.dependency 'libwebp/demux'
    ss.source_files = ['src/mux/*.{h,c}', 'src/webp/mux.h']
    ss.public_header_files = 'src/webp/mux.h'
  end
end
