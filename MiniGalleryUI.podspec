#
# Be sure to run `pod lib lint MiniGalleryUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MiniGalleryUI'
  s.version          = '1.0.0'
  s.summary          = 'A ui component for mini gallery.'

  s.homepage         = 'https://github.com/felyfely/MiniGalleryUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/felyfely/MiniGalleryUI.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'MiniGalleryUI/Framework/*.swift'
  s.swift_version = '5.0'

end
