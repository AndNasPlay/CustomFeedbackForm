//
//  SecondWithoutMSVViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 07.07.2021.
//

import UIKit

class SecondWithoutMSVViewController: UIViewController, ViewDelegate, UIScrollViewDelegate {

	var newView = SecondView(
		frame: .zero,
		titleLableConfigurationSource: "Send us a message",
		buttonTitleConfigurationSource: "Send",
		buttonTitleColorConfigurationSource: .white,
		firstButtonColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		secondButtonColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		backgroundColorConfigurationSource: .white)

	var sendMessage: FirstAndSecondFeedbackStruct?

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
		setupNewViews(newView: newView, scrollView: newScrollView, mainView: view)

		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {

		let contentInsetBottomConst: CGFloat = 5.0

		guard let userInfo = notification.userInfo else { return }
		// swiftlint:disable force_cast
		var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
		// swiftlint:enable force_cast
		keyboardFrame = self.view.convert(keyboardFrame, from: nil)

		var contentInset: UIEdgeInsets = self.newScrollView.contentInset
		contentInset.bottom = keyboardFrame.size.height + contentInsetBottomConst
		newScrollView.contentInset = contentInset
	}

	@objc func keyboardWillHide(notification: NSNotification) {

		let contentInset: UIEdgeInsets = UIEdgeInsets.zero
		newScrollView.contentInset = contentInset
	}

	func submit() {
		sendMessage = getSecondViewTetextfieldValue(view: newView)
		let viewController = TheThirdWithoutMSVViewController()
		navigationController?.pushViewController(viewController, animated: true)
	}
}
