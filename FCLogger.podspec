#
# Be sure to run `pod lib lint FCLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FCLogger'
  s.version          = '0.1.0'
  s.summary          = 'A DDAbstractLogger implementation, shows CocoaLumberjack logs in s UITextView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
FCLogger is a DDAbstractLogger implementation that allow all the CocoaLumberjack logs to be displayed inside the app, supports custom colors (Like XCodeColors).
                       DESC

  s.homepage         = 'https://github.com/federicocappelli/FCLogger'
  s.screenshots     = 'https://github.com/federicocappelli/FCLogger/raw/master/Example/Screenshots/fcLogger_sc1.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Federico Cappelli' => 'info@federicocappelli.net' }
  s.source           = { :git => 'https://github.com/federicocappelli/FCLogger.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/federicokappe'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FCLogger/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FCLogger' => ['FCLogger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'CocoaLumberjack'
end
