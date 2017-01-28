#
# Be sure to run `pod lib lint WDScrollableSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WDScrollableSegmentedControl'
  s.version          = '0.1.0'
  s.summary          = 'Minimal segmented control, scrollable, customizable, animatable, easy as hell to use.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Wildog/WDScrollableSegmentedControl'
  s.screenshots     = 'https://raw.githubusercontent.com/Wildog/WDScrollableSegmentedControl/master/screenshot.gif', 'https://raw.githubusercontent.com/Wildog/WDScrollableSegmentedControl/master/ibinspectable.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wildog' => 'i@wil.dog' }
  s.source           = { :git => 'https://github.com/Wildog/WDScrollableSegmentedControl.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/WildogGo'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WDScrollableSegmentedControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WDScrollableSegmentedControl' => ['WDScrollableSegmentedControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
