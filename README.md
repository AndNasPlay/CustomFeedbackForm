# About

![alt text](https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/swiftcf.png "screen")

SwiftCustomFeedbackForm 
Custom Feedback form is a views library including various methods and a simple interface

![alt text](https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/list%20of%20view.png "screen")

SwiftCustomFeedbackForm, library feedback forms for iOS

![alt text](https://github.com/AndNasPlay/CustomFeedbackForm/blob/main/list%20of%20Congratulation%20view.png "screen")

Custom Feedback form is a quick and easy way to add feedback UI to your app. If you need to quickly prototype an app, create an MVP or finish an app for a hackathon, Custom Feedback  can help you by letting you focus on what makes your app special. But if what you really want is a really specific and customized feedback form flow you are probably better off creating it on your own.

# Installation

Coming soon

# Getting Started

## Example code

```swift
import UIKit
import CustomFeedbackForm

class FirstViewController: CustomFeedbackForm.MainViewController, CustomFeedbackForm.ViewDelegate {

	var newView: CustomFeedbackForm.MainView = CustomFeedbackForm.FirstView(
		frame: .zero,
		logoConfigurationSource: UIImage(named: "mailIcon")!,
		titleLableConfigurationSource: "Send us a message",
		buttonTitleConfigurationSource: "Send",
		buttonTitleColorConfigurationSource: .white,
		firstButtonColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		secondButtonColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		backgroundColorConfigurationSource: .white
	)

	var sendMessage: CustomFeedbackForm.FirstAndSecondFeedbackStruct?

	override func viewDidLoad() {
		super.viewDidLoad()
		CustomFeedbackForm.addNewViewAndScrollView(newView: newView, newScrollView: newScrollView, mainView: view)
		newView.delegate = self
		view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
	}

	func submit() {
		sendMessage = CustomFeedbackForm.getFirstAndSecondFeedbackStruct(view: newView)
	}
}

```

# Configuration

## Initialization Views
View| Initialization
------------ | -------------
FirstView | frame: *CGRect*, <br> logoConfigurationSource: *UIImage*, <br> titleLableConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*, <br> firstButtonColorConfigurationSource: *UIColor*, <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
SecondView | frame: *CGRect*, <br> titleLableConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*, <br> firstButtonColorConfigurationSource: *UIColor*, <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
TheThirdView | frame: *CGRect*, <br> productImgConfigurationSource: *UIImage*, <br> productNameConfigurationSource: *String*, <br> productPridceConfigurationSource: String, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
FourthView| frame: *CGRect*,  <br> logoConfigurationSource: *UIImage*,  <br> titleLableConfigurationSource: *String*,  <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*,  <br> firstButtonColorConfigurationSource: *UIColor*,  <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
FirstCongratulationView | frame: *CGRect*, <br> logoConfigurationSource: *UIImage*, <br> titleConfigurationSource: *String*, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
SecondCongratulationView | frame: *CGRect*, <br> titleConfigurationSource: *String*, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*

## Methods and Structs

View | Methods and Structs
------------ | -------------
FirstView SecondView| 
```swift 
getFirstAndSecondFeedbackStruct(view: MainView) -> FirstAndSecondFeedbackStruct 
```
TheThirdView |
```swift 
getTheThirdFeedbackStruct(view: MainView) -> ThirdFeedbackStruct
```
FourthView |
```swift getFourthFeedbackStruct(view: MainView) -> FourthFeedbackStruct
```

## For all views
*Adds constraints for new view without scrollView* <br>
```swift
setupNewView(newView: UIView, mainView: UIView)
```
*Adds constraints for new view with a scrollView* <br>
```swift
addNewViewAndScrollView(newView: UIView, newScrollView: MainScrollView, mainView: UIView)
```
## Author
Andrey Shchekatunov

## License
MIT license. See the LICENSE file for more info.
