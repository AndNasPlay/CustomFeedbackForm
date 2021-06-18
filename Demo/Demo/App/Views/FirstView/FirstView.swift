//
//  FirstView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit

class FirstView: MainView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureStackView()
		createSubviews()
		constraintsInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		configureStackView()
		createSubviews()
		constraintsInit()
	}

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
		var button = UIButton(type: .system)
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.setTitle("Submit", for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = UIColor(named: "blueGradientTwo")
		return button
	}()
 
	private(set) lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
		stackView.spacing = 30
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	func createSubviews() {
		backgroundColor = .white
		self.addSubview(logo)
		self.addSubview(textLable)
		self.addSubview(stackView)
	}

	func configureStackView() {
		stackView.addArrangedSubview(nameTextField)
		stackView.addArrangedSubview(emailTextField)
		stackView.addArrangedSubview(textView)
		stackView.addArrangedSubview(submitButton)
		submitButton.addTarget(self,
							   action: #selector(handleSubmitTouchUpInseide),
							   for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([
			logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
			logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),

			textLable.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50),
			textLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),

			stackView.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 40),
			stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

			nameTextField.heightAnchor.constraint(equalToConstant: 50),

			emailTextField.heightAnchor.constraint(equalToConstant: 50),

			textView.heightAnchor.constraint(equalToConstant: 100),

			submitButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	@objc func handleSubmitTouchUpInseide() {
		delegate?.submit()
	}
}
