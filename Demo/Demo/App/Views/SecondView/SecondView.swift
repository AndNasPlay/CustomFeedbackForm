//
//  SecondView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 16.06.2021.
//

import UIKit

class SecondView: MainView {

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

	private(set) lazy var productIMG: UIImageView = {
		let logoView = UIImageView()
		logoView.image = UIImage(named: "girl3.png")
		logoView.layer.masksToBounds = true
		logoView.translatesAutoresizingMaskIntoConstraints = false
		return logoView
	}()

	private(set) lazy var spaceView: UIView = {
		let spaceView = UIView()
		return spaceView
	}()

	private(set) lazy var ratingView: UIView = {
		let ratingView = UIView()
		ratingView.backgroundColor = .red
		return ratingView
	}()

	private(set) lazy var productName: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.systemFont(ofSize: 15.0)
		text.text = "Red case Iphone XR"
		text.numberOfLines = 0
		text.textAlignment = .left
		return text
	}()

	private(set) lazy var productPrice: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 15.0)
		text.text = "3 USD"
		text.numberOfLines = 0
		text.textAlignment = .left
		return text
	}()

	private(set) lazy var subTitleText: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.systemFont(ofSize: 14.0)
		text.text = "На сколько точным было описание товара?"
		text.numberOfLines = 0
		text.textAlignment = .left
		return text
	}()

	private(set) lazy var textView: UITextView = {
		var textView = UITextView()
		textView.isAccessibilityElement = true
		textView.layer.cornerRadius = 5
		textView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
		textView.layer.borderWidth = 1
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.font = UIFont.systemFont(ofSize: 14.0)
		return textView
	}()

	private(set) lazy var submitButton: GradientButton = {
		var button = GradientButton(colors: [UIColor(named: "blueGradientOne")!.cgColor,
											 UIColor(named: "blueGradientTwo")!.cgColor])
		button.layer.cornerRadius = 2.0
		button.layer.masksToBounds = true
		button.setTitle("Submit", for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	private(set) lazy var firstStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private(set) lazy var firstRightStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private(set) lazy var secondStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
		stackView.spacing = 30
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	func createSubviews() {
		backgroundColor = .white
		self.addSubview(firstStackView)
		self.addSubview(secondStackView)
		self.addSubview(submitButton)
		submitButton.addTarget(self,
							   action: #selector(handleSubmitTouchUpInseide),
							   for: .touchUpInside)
	}

	func configureStackView() {
		firstStackView.addArrangedSubview(productIMG)
		firstStackView.addArrangedSubview(spaceView)
		firstStackView.addArrangedSubview(firstRightStackView)

		firstRightStackView.addArrangedSubview(productName)
		firstRightStackView.addArrangedSubview(productPrice)

		secondStackView.addArrangedSubview(subTitleText)
		secondStackView.addArrangedSubview(ratingView)
		secondStackView.addArrangedSubview(textView)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			firstStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
			firstStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 40),
			firstStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),

			productIMG.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.30),

			spaceView.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.05),

			firstRightStackView.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.65),

			productName.heightAnchor.constraint(equalToConstant: 40),

			productPrice.heightAnchor.constraint(equalToConstant: 40),

			secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 40),
			secondStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
			secondStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
			secondStackView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -50),

			ratingView.heightAnchor.constraint(equalToConstant: 25),

			textView.heightAnchor.constraint(equalToConstant: 100),

			submitButton.heightAnchor.constraint(equalToConstant: 50),
			submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
		])
	}

	@objc func handleSubmitTouchUpInseide() {
		delegate?.submit()
	}
}
