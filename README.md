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

## Example code

```swift
import UIKit
import CustomFeedbackForm

class FirstViewController: UIViewController, CustomFeedbackForm.ViewDelegate, UIScrollViewDelegate {

	var newView = CustomFeedbackForm.FirstView(
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

	var newScrollView: UIScrollView = {
		var scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		return scroll
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(newScrollView)
		newScrollView.addSubview(newView)
		newView.delegate = self
		view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
		CustomFeedbackForm.setupNewViews(newView: newView, scrollView: newScrollView, mainView: view)

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {

		let contentInsetBottomConst: CGFloat = 20.0

		guard let userInfo = notification.userInfo else { return }
		// swiftlint:disable force_cast
		var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
		keyboardFrame = self.view.convert(keyboardFrame, from: nil)
		// swiftlint:enable force_cast
		var contentInset: UIEdgeInsets = self.newScrollView.contentInset
		contentInset.bottom = keyboardFrame.size.height + contentInsetBottomConst
		newScrollView.contentInset = contentInset
	}

	@objc func keyboardWillHide(notification: NSNotification) {

		let contentInset: UIEdgeInsets = UIEdgeInsets.zero
		newScrollView.contentInset = contentInset
	}

	func submit() {
		sendMessage = CustomFeedbackForm.getFirstViewTetextfieldValue(view: newView)
		let viewController = FirstCongratulationViewController()
		navigationController?.pushViewController(viewController, animated: true)
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
FourView | frame: *CGRect*,  <br> logoConfigurationSource: *UIImage*,  <br> titleLableConfigurationSource: *String*,  <br> buttonTitleConfigurationSource: *String*, <br> buttonTitleColorConfigurationSource: *UIColor*,  <br> firstButtonColorConfigurationSource: *UIColor*,  <br> secondButtonColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
FirstCongratulationView | frame: *CGRect*, <br> logoConfigurationSource: *UIImage*, <br> titleConfigurationSource: *String*, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*
SecondCongratulationView | frame: *CGRect*, <br> titleConfigurationSource: *String*, <br> subTitleConfigurationSource: *String*, <br> buttonTitleConfigurationSource: *String*, <br> buttonFirstColorConfigurationSource: *UIColor*, <br> buttonSecondColorConfigurationSource: *UIColor*, <br> backgroundColorConfigurationSource: *UIColor*

## Methods and Structs

View | Methods and Structs
------------ | -------------
FirstView | getFirstViewTetextfieldValue(view: FirstView ) -> FirstAndSecondFeedbackStruct
SecondView | getSecondViewTetextfieldValue(view: SecondView ) -> FirstAndSecondFeedbackStruct
TheThirdView | getTheThirdViewTetextfieldValue(view: TheThirdView ) -> ThirdFeedbackStruct
FourView | getFourViewTetextfieldValue(view: FourView ) -> FourFeedbackStruct

## For all view 
*Adds constraints for new view without scrollView* <br>
	setupNewView(newView: UIView, mainView: UIView)
*Adds constraints for new view with a scrollView* <br>
	setupNewViews(newView: UIView, scrollView: UIScrollView, mainView: UIView)

## Author
Andrey Shchekatunov

## License
MIT license. See the LICENSE file for more info.
