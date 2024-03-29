//
//  SecondCongratulationView.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit

public class SecondCongratulationView: MainView {
	var titleConfigurationSource: String
	var subTitleConfigurationSource: String
	var buttonTitleConfigurationSource: String
	var buttonFirstColorConfigurationSource: UIColor
	var buttonSecondColorConfigurationSource: UIColor
	var backgroundColorConfigurationSource: UIColor

	public init(
		frame: CGRect,
		titleConfigurationSource: String,
		subTitleConfigurationSource: String,
		buttonTitleConfigurationSource: String,
		buttonFirstColorConfigurationSource: UIColor,
		buttonSecondColorConfigurationSource: UIColor,
		backgroundColorConfigurationSource: UIColor) {
		self.titleConfigurationSource = titleConfigurationSource
		self.subTitleConfigurationSource = subTitleConfigurationSource
		self.buttonTitleConfigurationSource = buttonTitleConfigurationSource
		self.buttonFirstColorConfigurationSource = buttonFirstColorConfigurationSource
		self.buttonSecondColorConfigurationSource = buttonSecondColorConfigurationSource
		self.backgroundColorConfigurationSource = backgroundColorConfigurationSource
		super.init(frame: frame)
		createSubviews()
		constraintsInit()
		accessibilityIdentifier = "secondCongratulationView"
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

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

	private(set) lazy var submitButton: GradientButton = {
		var button = GradientButton(colors: [buttonFirstColorConfigurationSource.cgColor,
											 buttonSecondColorConfigurationSource.cgColor])
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
		button.setTitle(buttonTitleConfigurationSource, for: .normal)
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		button.accessibilityIdentifier = "button"
		return button
	}()

	func createSubviews() {
		backgroundColor = backgroundColorConfigurationSource
		self.addSubview(textLable)
		self.addSubview(messageLable)
		self.addSubview(submitButton)
		submitButton.addTarget(self,
							   action: #selector(handleSubmitTouchUpInseide),
							   for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([
			textLable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
			textLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),

			messageLable.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 100),
			messageLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			messageLable.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
			messageLable.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),

			submitButton.topAnchor.constraint(equalTo: messageLable.bottomAnchor, constant: 100),
			submitButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
			submitButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
			submitButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	@objc func handleSubmitTouchUpInseide() {
		delegate?.submit()
	}
}
