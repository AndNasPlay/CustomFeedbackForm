//
//  TestViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 18.06.2021.
//

import UIKit
import CustomFeedbackForm

class TestViewController: UIViewController, CustomFeedbackForm.FirstViewDelegate, UIScrollViewDelegate {

	func submit() {
		print(2)
	}

	var mainScrollView = CustomFeedbackForm.MainScrollView(frame: .zero, needUiView: .firstView)

	override func viewDidLoad() {
		super.viewDidLoad()
		mainScrollView.contentView.delegate = self
		view.addSubview(mainScrollView)
		view.backgroundColor = .white
		setupScrollView()

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {

		let contentInsetBottomConst: CGFloat = 20.0

		guard let userInfo = notification.userInfo else { return }
		var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
		keyboardFrame = self.view.convert(keyboardFrame, from: nil)

		var contentInset: UIEdgeInsets = self.mainScrollView.contentInset
		contentInset.bottom = keyboardFrame.size.height + contentInsetBottomConst
		mainScrollView.contentInset = contentInset
	}

	@objc func keyboardWillHide(notification: NSNotification) {

		let contentInset: UIEdgeInsets = UIEdgeInsets.zero
		mainScrollView.contentInset = contentInset
	}

	func setupScrollView(){
		navigationController?.navigationBar.isHidden = true
		mainScrollView.translatesAutoresizingMaskIntoConstraints = false

		mainScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		mainScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
}
