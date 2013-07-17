Pod::Spec.new do |spec|
  spec.name         = 'DTCoreTextTheo'
  spec.version      = '1.6.1mod2'
  spec.platform     = :ios, '4.3'
  spec.license      = 'BSD'
  spec.source       = { :git => 'https://github.com/TheoA/DTCoreText.git', :tag => spec.version.to_s, :branch => 'TheoPodspec' }
  spec.source_files = 'Core/Source/*.{h,m,c}'
  spec.dependency 'DTFoundation/Core', '~>1.4.3'
  spec.dependency 'DTFoundation/UIKit', '~>1.4.3'
  spec.dependency 'DTFoundation/DTHMLParser', '~>1.4.3'
  spec.frameworks   = 'MediaPlayer', 'QuartzCore', 'CoreText', 'CoreGraphics', 'ImageIO'
  spec.requires_arc = true
  spec.homepage     = 'https://github.com/TheoA/DTCoreText'
  spec.summary      = 'Methods to allow using HTML code with CoreText.'
  spec.author       = { 'Oliver Drobnik' => 'oliver@cocoanetics.com' }
  spec.prefix_header_contents = '#import <CoreText/CoreText.h>'

  spec.pre_install do |pod_representation, library_representation|
    Dir.chdir(pod_representation.root + 'Core/Source/') do
      Dir.glob('*.css') do |css_file|
        system '/usr/bin/xxd', '-i', css_file, css_file + '.c'
      end
    end
  end
end

