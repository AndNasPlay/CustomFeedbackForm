# About

![alt text](https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/swiftcf.png "screen")

SwiftCustomFeedbackForm 
Custom Feedback form is a views library including various methods and a simple interface

![alt text](https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/list%20of%20view.png "screen")

SwiftCustomFeedbackForm, library feedback forms for iOS

![alt text](https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/list%20of%20Congratulation%20view.png "screen")

Custom Feedback form is a quick and easy way to add feedback UI to your app. If you need to quickly prototype an app, create an MVP or finish an app for a hackathon, Custom Feedback  can help you by letting you focus on what makes your app special. But if what you really want is a really specific and customized feedback form flow you are probably better off creating it on your own.

# Installation

# Getting Started

# Configuration

## Initialization Views
View| Initialization
------------ | -------------
FirstView | frame: *CGRect*, <br> logoConfigurationSource: *UIImage*, <br> titleLableConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*, <br> firstButtonColorConfigurationSource: *UIColor*, <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
SecondView | frame: *CGRect*, <br> titleLableConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*, <br> firstButtonColorConfigurationSource: *UIColor*, <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
TheThirdView | frame: *CGRect*, <br> productImgConfigurationSource: *UIImage*, <br> productNameConfigurationSource: *String*, <br> productPridceConfigurationSource: String, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
FourView | frame: *CGRect*,  <br> logoConfigurationSource: *UIImage*,  <br> titleLableConfigurationSource: *String*,  <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*,  <br> firstButtonColorConfigurationSource: *UIColor*,  <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
FirstCongratulationView | frame: *CGRect*, <br> logoConfigurationSource: *UIImage*, <br> titleConfigurationSource: *String*, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
SecondCongratulationView | frame: *CGRect*, <br> titleConfigurationSource: *String*, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*

## Methods and Structs

View | Methods and Structs
------------ | -------------
FirstView | getFirstViewTetextfieldValue(view: FirstView ) -> FirstAndSecondFeedbackStruct <br> FirstAndSecondFeedbackStruct <br> var name: String <br>
var email: String <br> var textMessage: String
SecondView | getSecondViewTetextfieldValue(view: SecondView ) -> FirstAndSecondFeedbackStruct <br> FirstAndSecondFeedbackStruct
TheThirdView | getTheThirdViewTetextfieldValue(view: TheThirdView ) -> ThirdFeedbackStruct <br> ThirdFeedbackStruct
FourView | getFourViewTetextfieldValue(view: FourView ) -> FourFeedbackStruct <br> FourFeedbackStruct

## Author
Andrey Shchekatunov

## License
MIT license. See the LICENSE file for more info.
