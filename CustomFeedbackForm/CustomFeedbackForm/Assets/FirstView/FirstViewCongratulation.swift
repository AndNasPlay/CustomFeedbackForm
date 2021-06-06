//
//  FirstViewCongratulation.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 06.06.2021.
//

import UIKit

public protocol FirstViewCongratulationDelegate: AnyObject {
	func submit()
}

public class FirstViewCongratulation: UIView {

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

	public weak var delegate: FirstViewCongratulationDelegate?

	private(set) lazy var logo: UIImageView = {
		let logoView = UIImageView()
		logoView.image = UIImage(named: "mailbx.png")
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

	private(set) lazy var massageLable: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 16.0)
		text.text = "We will reach you with you e-mail address soon. Thank you!"
		text.numberOfLines = 0
		text.textAlignment = .center
		return text
	}()



	private(set) lazy var submitButton: UIButton = {
		let button = UIButton()
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.backgroundColor = UIColor(named: "blueGradientTwo")
		button.setTitle("Go back", for: .normal)
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	func createSubviews() {
		backgroundColor = .white
		self.addSubview(logo)
		self.addSubview(textLable)
		self.addSubview(massageLable)
		self.addSubview(submitButton)
		self.submitButton.addTarget(self,
									action: #selector(handleSubmitTouchUpInseide),
									for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([
			logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
			logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			textLable.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50),
			textLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			massageLable.topAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 30),
			massageLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			massageLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
			massageLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
			submitButton.topAnchor.constraint(equalTo: self.massageLable.bottomAnchor, constant: 50),
			submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
			submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
			submitButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	@objc func handleSubmitTouchUpInseide() {
		delegate?.submit()
	}
}
