//
//  MainViewController.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 14.07.2021.
//

import UIKit

open class MainViewController: UIViewController, UIScrollViewDelegate {

	public var newScrollView = MainScrollView()

	open override func viewDidLoad() {
		super.viewDidLoad()
		let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
		self.view.addGestureRecognizer(tap)
		view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true

		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func handleScreenTap(sender: UITapGestureRecognizer) {
		self.view.endEditing(true)
	}

	@objc func keyboardWillShow(notification: NSNotification) {
		let contentInsetBottomConst: CGFloat = 15.0
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

	deinit {
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
	}
}

