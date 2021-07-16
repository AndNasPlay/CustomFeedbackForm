#
# Be sure to run `pod lib lint CustomFeedbackForm.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = 'CustomFeedbackForm'
	s.version          = '0.1.0'
	s.summary          = 'Views library including various methods and a simple interface.'

	# This description is used to generate tags and improve search results.
	#   * Think: What does it do? Why did you write it? What is the focus?
	#   * Try to keep it short, snappy and to the point.
	#   * Write the description between the DESC delimiters below.
	#   * Finally, don't worry about the indent, CocoaPods strips it!

	s.description      = <<-DESC
	'Custom Feedback form is a quick and easy way to add feedback UI to your app. If you need to quickly prototype an app, create an MVP or finish an app for a hackathon, Custom Feedback can help you by letting you focus on what makes your app special. But if what you really want is a really specific and customized feedback form flow you are probably better off creating it on your own.'
	DESC

	s.homepage         = 'https://github.com/AndNasPlay/CustomFeedbackForm'
	# s.screenshots     = 'https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/list%20of%20view.png', 'https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/list%20of%20Congratulation%20view.png'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'AndNasPlay' => 'shchekatunov.av@gmail.com' }
	s.source           = { :git => 'https://github.com/AndNasPlay/CustomFeedbackForm.git', :tag => s.version.to_s }
	# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

	s.ios.deployment_target = '12.1'

	s.source_files = 'Source/**/*.swift'
	s.swift_version = '5.0'
	s.platforms = {
		"ios": "12.1"
	}

	# s.resource_bundles = {
	#   'CustomFeedbackForm' => ['CustomFeedbackForm/Assets/*.png']
	# }

	# s.public_header_files = 'Pod/Classes/**/*.h'
	# s.frameworks = 'UIKit', 'MapKit'
	# s.dependency 'AFNetworking', '~> 2.3'
end
