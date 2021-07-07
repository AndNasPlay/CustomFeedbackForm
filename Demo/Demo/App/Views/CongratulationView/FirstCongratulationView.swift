//
//  FirstCongratulationView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit

class FirstCongratulationView: UIView {

	var logoConfigurationSource: UIImage

	var titleConfigurationSource: String

	var subTitleConfigurationSource: String

	var buttonTitleConfigurationSource: String

	var buttonColorConfigurationSource: UIColor

	var backgroundColorConfigurationSource: UIColor

	init(
		frame: CGRect,
		logoConfigurationSource: UIImage,
		titleConfigurationSource: String,
		subTitleConfigurationSource: String,
		buttonTitleConfigurationSource: String,
		buttonColorConfigurationSource: UIColor,
		backgroundColorConfigurationSource: UIColor) {
		self.logoConfigurationSource = logoConfigurationSource
		self.titleConfigurationSource = titleConfigurationSource
		self.subTitleConfigurationSource = subTitleConfigurationSource
		self.buttonTitleConfigurationSource = buttonTitleConfigurationSource
		self.buttonColorConfigurationSource = buttonColorConfigurationSource
		self.backgroundColorConfigurationSource = backgroundColorConfigurationSource
		super.init(frame: frame)
		createSubviews()
		constraintsInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	weak var delegate: ViewDelegate?

	private(set) lazy var logo: UIImageView = {
		let logoView = UIImageView()
		logoView.image = logoConfigurationSource
		logoView.layer.masksToBounds = true
		logoView.translatesAutoresizingMaskIntoConstraints = false
		return logoView
	}()

	private(set) lazy var textLable: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 23.0)
		text.text = titleConfigurationSource
		return text
	}()

	private(set) lazy var messageLable: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 16.0)
		text.text = subTitleConfigurationSource
		text.numberOfLines = 0
		text.textAlignment = .center
		return text
	}()

	private(set) lazy var submitButton: UIButton = {
		let button = UIButton(type: .system)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.backgroundColor = buttonColorConfigurationSource
		button.setTitle(buttonTitleConfigurationSource, for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	func createSubviews() {
		backgroundColor = backgroundColorConfigurationSource
		self.addSubview(logo)
		self.addSubview(textLable)
		self.addSubview(messageLable)
		self.addSubview(submitButton)
		submitButton.addTarget(self,
							   action: #selector(handleSubmitTouchUpInseide),
							   for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
			logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),

			textLable.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50),
			textLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),

			messageLable.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 30),
			messageLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
			messageLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),

			submitButton.topAnchor.constraint(equalTo: messageLable.bottomAnchor, constant: 50),
			submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
			submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
			submitButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	@objc func handleSubmitTouchUpInseide() {
		delegate?.submit()
	}
}