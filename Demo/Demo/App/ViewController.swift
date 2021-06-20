//
//  ViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit

class ViewController: UIViewController, FirstViewDelegate, UIScrollViewDelegate {

	func submit() {
		let viewController = CongratulationViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
		print(viewStruct(name: scrollView.contentView.formForFeedback?.name, email: scrollView.contentView.formForFeedback?.email, textMassage: scrollView.contentView.formForFeedback?.textMassage, rating: nil))
	}

	let scrollView = MainScrollView(frame: .zero, needUiView: .firstView, ConfigurationSource: configurationSourceStruct(logoConfigurationSource: UIImage(named: "mailIcon")!, textLableConfigurationSource: "Send us a massage", backgroundColorConfigurationSource: .gray))

	override func viewDidLoad() {
		super.viewDidLoad()
		scrollView.contentView.delegate = self
		view.addSubview(scrollView)
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

		var contentInset: UIEdgeInsets = self.scrollView.contentInset
		contentInset.bottom = keyboardFrame.size.height + contentInsetBottomConst
		scrollView.contentInset = contentInset
	}

	@objc func keyboardWillHide(notification: NSNotification) {

		let contentInset: UIEdgeInsets = UIEdgeInsets.zero
		scrollView.contentInset = contentInset
	}

	func setupScrollView(){
		navigationController?.navigationBar.isHidden = true
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
}
