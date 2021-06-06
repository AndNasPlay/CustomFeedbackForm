//
//  FirstView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit

protocol FirstViewDelegate: AnyObject {
	func submit()
}

class FirstView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		createSubviews()
		constraintsInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		createSubviews()
		constraintsInit()
	}

	weak var delegate: FirstViewDelegate?

	private(set) lazy var logo: UIImageView = {
		let logoView = UIImageView()
		logoView.image = UIImage(named: "mailIcon.png")
		logoView.layer.masksToBounds = true
		logoView.translatesAutoresizingMaskIntoConstraints = false
		return logoView
	}()

	private(set) lazy var textLable: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 23.0)
		text.text = "Send us a message"
		return text
	}()

	private(set) lazy var nameTextField: UITextField = {
		var nameTextField = UITextField()
		nameTextField.placeholder = "Name"
		nameTextField.layer.borderColor = UIColor(named: "borderColor")?.cgColor
		nameTextField.layer.borderWidth = 1
		nameTextField.layer.cornerRadius = 5
		nameTextField.textContentType = .name
		nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
		nameTextField.isAccessibilityElement = true
		nameTextField.font = UIFont.systemFont(ofSize: 17.0)
		nameTextField.translatesAutoresizingMaskIntoConstraints = false
		return nameTextField
	}()

	private(set) lazy var emailTextField: UITextField = {
		var emailTextField = UITextField()
		emailTextField.placeholder = "Email"
		emailTextField.layer.borderColor = UIColor(named: "borderColor")?.cgColor
		emailTextField.layer.borderWidth = 1
		emailTextField.layer.cornerRadius = 5
		emailTextField.textContentType = .emailAddress
		emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
		emailTextField.isAccessibilityElement = true
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.font = UIFont.systemFont(ofSize: 17.0)
		return emailTextField
	}()

	private(set) lazy var textView: UITextView = {
		var textView = UITextView()
		textView.isAccessibilityElement = true
		textView.layer.cornerRadius = 5
		textView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
		textView.layer.borderWidth = 1
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.font = UIFont.systemFont(ofSize: 17.0)
		return textView
	}()

	private(set) lazy var submitButton: UIButton = {
		let button = UIButton()
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.backgroundColor = UIColor(named: "blueGradientTwo")
		button.setTitle("Submit", for: .normal)
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	func createSubviews() {
		backgroundColor = .white
		self.addSubview(logo)
		self.addSubview(textLable)
		self.addSubview(nameTextField)
		self.addSubview(emailTextField)
		self.addSubview(textView)
		self.addSubview(submitButton)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([
			logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
			logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			textLable.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50),
			textLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			nameTextField.topAnchor.constraint(equalTo: self.textLable.bottomAnchor, constant: 40),
			nameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			nameTextField.heightAnchor.constraint(equalToConstant: 50),
			emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 30),
			emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			emailTextField.heightAnchor.constraint(equalToConstant: 50),
			textView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 30),
			textView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			textView.heightAnchor.constraint(equalToConstant: 100),
			submitButton.topAnchor.constraint(equalTo: self.textView.bottomAnchor, constant: 50),
			submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			submitButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	@objc func handleSubmitTouchUpInseide() {
		delegate?.submit()
	}
}
