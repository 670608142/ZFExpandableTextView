#
# Be sure to run `pod lib lint ZFExpandableTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZFExpandableTextView'
  s.version          = '0.1.0'
  s.summary          = 'An Expandable TexView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An Expandable TexView.
一个可扩展的UITextView
                       DESC

  s.homepage         = 'https://github.com/670608142/ZFExpandableTextView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '670608142' => '670608142@qq.com' }
  s.source           = { :git => 'https://github.com/670608142/ZFExpandableTextView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZFExpandableTextView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZFExpandableTextView' => ['ZFExpandableTextView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
