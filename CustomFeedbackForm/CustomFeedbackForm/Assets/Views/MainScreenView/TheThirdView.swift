//
//  TheThirdView.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit

public class TheThirdView: MainView {

	public var productImgConfigurationSource: UIImage

	public var productNameConfigurationSource: String

	public var productPridceConfigurationSource: String

	public var subTitleConfigurationSource: String

	public var buttonTitleConfigurationSource: String

	public var buttonFirstColorConfigurationSource: UIColor

	public var buttonSecondColorConfigurationSource: UIColor

	public var backgroundColorConfigurationSource: UIColor

	public init(
		frame: CGRect,
		productImgConfigurationSource: UIImage,
		productNameConfigurationSource: String,
		productPridceConfigurationSource: String,
		subTitleConfigurationSource: String,
		buttonTitleConfigurationSource: String,
		buttonFirstColorConfigurationSource: UIColor,
		buttonSecondColorConfigurationSource: UIColor,
		backgroundColorConfigurationSource: UIColor) {

		self.productImgConfigurationSource = productImgConfigurationSource
		self.productNameConfigurationSource = productNameConfigurationSource
		self.productPridceConfigurationSource = productPridceConfigurationSource
		self.subTitleConfigurationSource = subTitleConfigurationSource
		self.buttonTitleConfigurationSource = buttonTitleConfigurationSource
		self.buttonFirstColorConfigurationSource = buttonFirstColorConfigurationSource
		self.buttonSecondColorConfigurationSource = buttonSecondColorConfigurationSource
		self.backgroundColorConfigurationSource = backgroundColorConfigurationSource

		super.init(frame: frame)
		configureStackView()
		createSubviews()
		constraintsInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private(set) lazy var productIMG: UIImageView = {
		let logoView = UIImageView()
		logoView.image = productImgConfigurationSource
		logoView.layer.masksToBounds = true
		logoView.translatesAutoresizingMaskIntoConstraints = false
		return logoView
	}()

	private(set) lazy var productName: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.systemFont(ofSize: 15.0)
		text.text = productNameConfigurationSource
		text.numberOfLines = 0
		text.textAlignment = .left
		return text
	}()

	private(set) lazy var productPrice: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.boldSystemFont(ofSize: 15.0)
		text.text = productPridceConfigurationSource
		text.numberOfLines = 0
		text.textAlignment = .left
		return text
	}()

	private(set) lazy var subTitleText: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.font = UIFont.systemFont(ofSize: 14.0)
		text.text = subTitleConfigurationSource
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

	private(set) lazy var starOneButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "iconlyLightStar")!, for: .normal)
		button.setImage(UIImage(named: "iconlyBoldStar")!, for: .selected)
		return button
	}()

	private(set) lazy var starTwoButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "iconlyLightStar")!, for: .normal)
		button.setImage(UIImage(named: "iconlyBoldStar")!, for: .selected)
		return button
	}()

	private(set) lazy var starThreeButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "iconlyLightStar")!, for: .normal)
		button.setImage(UIImage(named: "iconlyBoldStar")!, for: .selected)
		return button
	}()

	private(set) lazy var starFourButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "iconlyLightStar")!, for: .normal)
		button.setImage(UIImage(named: "iconlyBoldStar")!, for: .selected)
		return button
	}()

	private(set) lazy var starFiveButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "iconlyLightStar")!, for: .normal)
		button.setImage(UIImage(named: "iconlyBoldStar")!, for: .selected)
		return button
	}()

	private(set) lazy var subView: UIView = {
		var subView = UIView()
		return subView
	}()

	private(set) lazy var submitButton: GradientButton = {
		var button = GradientButton(colors: [buttonFirstColorConfigurationSource.cgColor,
											 buttonSecondColorConfigurationSource.cgColor])
		button.layer.cornerRadius = 2.0
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
		button.layer.masksToBounds = true
		button.setTitle(buttonTitleConfigurationSource, for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = 5
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	private(set) lazy var firstStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 20.0
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private(set) lazy var subStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private(set) lazy var firstRightStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 10.0
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private(set) lazy var ratingStackView: RatingController = {
		let stackView = RatingController()
		stackView.axis = .horizontal
		stackView.spacing = 5.0
		stackView.distribution =  .fill
		stackView.contentMode = .left
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
		backgroundColor = backgroundColorConfigurationSource
		self.addSubview(firstStackView)
		self.addSubview(secondStackView)
		self.addSubview(submitButton)
		submitButton.addTarget(self,
							   action: #selector(handleSubmitTouchUpInseide),
							   for: .touchUpInside)
	}

	func configureStackView() {
		firstStackView.addArrangedSubview(productIMG)
		firstStackView.addArrangedSubview(firstRightStackView)

		firstRightStackView.addArrangedSubview(productName)
		firstRightStackView.addArrangedSubview(productPrice)

		subStackView.addArrangedSubview(ratingStackView)
		subStackView.addArrangedSubview(subView)

		ratingStackView.addArrangedSubview(starOneButton)
		ratingStackView.addArrangedSubview(starTwoButton)
		ratingStackView.addArrangedSubview(starThreeButton)
		ratingStackView.addArrangedSubview(starFourButton)
		ratingStackView.addArrangedSubview(starFiveButton)

		secondStackView.addArrangedSubview(subTitleText)
		secondStackView.addArrangedSubview(subStackView)
		secondStackView.addArrangedSubview(textView)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			firstStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
			firstStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 40),
			firstStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),

			productIMG.widthAnchor.constraint(equalToConstant: 100),
			productIMG.heightAnchor.constraint(equalToConstant: 100),

			secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 40),
			secondStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
			secondStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
			secondStackView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -50),

			textView.heightAnchor.constraint(equalToConstant: 200),

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
