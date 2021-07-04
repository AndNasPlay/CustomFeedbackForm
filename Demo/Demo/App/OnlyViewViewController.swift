//
//  OnlyViewViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 02.07.2021.
//

import UIKit

class OnlyViewViewController: UIViewController, FirstViewDelegate, UIScrollViewDelegate {

	var newView = FirstView(frame: .zero, logoConfigurationSource: UIImage(named: "mailIcon")!, textLableConfigurationSource: "Send us a massage", backgroundColorConfigurationSource: .white)

	var sendMassage: viewStruct? = nil

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
		setupNewView()

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }

	@objc func keyboardWillShow(notification: NSNotification) {

		let contentInsetBottomConst: CGFloat = 5.0

		guard let userInfo = notification.userInfo else { return }
		var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
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
		sendMassage = viewStruct(name: newView.nameTextField.text, email: newView.emailTextField.text, textMassage: newView.textView.text, rating: nil)
		print(sendMassage as Any)
		let viewController = CongratulationViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}

	func setupNewView(){
		navigationController?.navigationBar.isHidden = true
		newView.translatesAutoresizingMaskIntoConstraints = false

		newScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		newScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

		newScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		newScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

		newView.topAnchor.constraint(equalTo: newScrollView.topAnchor).isActive = true
		newView.leadingAnchor.constraint(equalTo: newScrollView.leadingAnchor).isActive = true
		newView.trailingAnchor.constraint(equalTo: newScrollView.trailingAnchor).isActive = true
		newView.bottomAnchor.constraint(equalTo: newScrollView.bottomAnchor).isActive = true
		newView.centerXAnchor.constraint(equalTo: newScrollView.centerXAnchor).isActive = true
	}

}
