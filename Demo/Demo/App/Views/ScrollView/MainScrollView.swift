//
//  MainScrollView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 09.06.2021.
//

import UIKit

public enum FeddbackForm: String {
	case firstView
	case secondView
}

class MainScrollView: UIScrollView {

	var contentView: MainView = FirstView(
		frame: .zero,
		logoConfigurationSource: UIImage(named: "mailIcon")!,
		titleLableConfigurationSource: "Send us a message",
		buttonTitleConfigurationSource: "Send",
		buttonTitleColorConfigurationSource: .green,
		firstButtonColorConfigurationSource: .white,
		secondButtonColorConfigurationSource: .black,
		backgroundColorConfigurationSource: .white
	)
	var configurationSource: ConfigurationSourceStruct
	var formForInit: FeddbackForm

	init(frame: CGRect, needUiView: FeddbackForm, configurationSource: ConfigurationSourceStruct) {
		self.formForInit = needUiView
		self.configurationSource = configurationSource
		super.init(frame: frame)
		scrollViewInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func initNewUIView(formForInit: FeddbackForm, configurationSource: ConfigurationSourceStruct) -> MainView {
		switch formForInit {
		case .firstView:
			return ThirdView(
				frame: .zero,
		  productImgConfigurationSource: UIImage(named: "pstcr500")!,
		  productNameConfigurationSource: "Card with corgi dog",
		  productPridceConfigurationSource: "4 USD",
		  subTitleConfigurationSource: "How much was the exact description of the item ?",
		  buttonTitleConfigurationSource: "Send",
		  buttonFirstColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		  buttonSecondColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		  backgroundColorConfigurationSource: .white)
		case .secondView:
			return ThirdView(
				frame: .zero,
		  productImgConfigurationSource: UIImage(named: "pstcr500")!,
		  productNameConfigurationSource: "Card with corgi dog",
		  productPridceConfigurationSource: "4 USD",
		  subTitleConfigurationSource: "How much was the exact description of the item ?",
		  buttonTitleConfigurationSource: "Send",
		  buttonFirstColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		  buttonSecondColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		  backgroundColorConfigurationSource: .white)
		}
	}

	func scrollViewInit() {

		contentView = initNewUIView(formForInit: self.formForInit, configurationSource: self.configurationSource)

		self.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(contentView)

		contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
		contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	}
}
