//
//  SecondView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 06.07.2021.
//

import UIKit

public class SecondView: MainView {

	public var titleLableConfigurationSource: String

	public var buttonTitleConfigurationSource: String

	public var buttonTitleColorConfigurationSource: UIColor

	public var firstButtonColorConfigurationSource: UIColor

	public var secondButtonColorConfigurationSource: UIColor

	public var backgroundColorConfigurationSource: UIColor

	public init(
		frame: CGRect,
		titleLableConfigurationSource: String,
		buttonTitleConfigurationSource: String,
		buttonTitleColorConfigurationSource: UIColor,
		firstButtonColorConfigurationSource: UIColor,
		secondButtonColorConfigurationSource: UIColor,
		backgroundColorConfigurationSource: UIColor) {
		self.titleLableConfigurationSource = titleLableConfigurationSource
		self.buttonTitleConfigurationSource = buttonTitleConfigurationSource
		self.buttonTitleColorConfigurationSource = buttonTitleColorConfigurationSource
		self.firstButtonColorConfigurationSource = firstButtonColorConfigurationSource
		self.secondButtonColorConfigurationSource = secondButtonColorConfigurationSource
		self.backgroundColorConfigurationSource = backgroundColorConfigurationSource
		super.init(frame: frame)
		configureStackView()
		createSubviews()
		constraintsInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private(set) lazy var textLable: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 23.0)
		text.text = titleLableConfigurationSource
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

	private(set) lazy var submitButton: GradientButton = {
		var button = GradientButton(colors: [firstButtonColorConfigurationSource.cgColor,
											 secondButtonColorConfigurationSource.cgColor])
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.setTitle(buttonTitleConfigurationSource, for: .normal)
		button.setTitleColor(buttonTitleColorConfigurationSource, for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
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
		backgroundColor = backgroundColorConfigurationSource
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

			textLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
			textLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),

			stackView.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 40),
			stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),

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
