#
# Be sure to run `pod lib lint YRAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "YRVCTransition"
  s.version          = "1.0.1"
  s.summary          = "Help to use the viewController transition iOS7 later."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Help to use the viewController transition iOS7 later, animation support four direction.
                       DESC

  s.homepage         = "https://github.com/YueRuo/YRVCTransition"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "wangxiaoyu" => "wxy_yueruo@126.com" }
  s.source           = { :git => "https://github.com/YueRuo/YRVCTransition.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'YRVCTransition/**/*'
end
