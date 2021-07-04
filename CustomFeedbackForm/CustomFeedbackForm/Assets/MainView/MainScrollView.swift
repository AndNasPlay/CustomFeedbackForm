//
//  MainScrollView.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 18.06.2021.
//

import UIKit

public enum FeddbackForm: String {
	case firstView
	case secondView
}

public class MainScrollView: UIScrollView {

	public var needUiView: FeddbackForm

	public var configurationSource: configurationSourceStruct

	public var contentView: MainView = FirstView(frame: .zero,
										  logoConfigurationSource: UIImage(named: "mailIcon")!,
										  textLableConfigurationSource: "Send us a massage",
										  backgroundColorConfigurationSource: .white)

	public init(frame: CGRect, needUiView: FeddbackForm, ConfigurationSource: configurationSourceStruct) {
		self.needUiView = needUiView
		self.configurationSource = ConfigurationSource
		super.init(frame: frame)
		scrollViewInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func initNewUIView(formForInit: FeddbackForm, ConfigurationSource: configurationSourceStruct) -> MainView {
		switch formForInit {
		case .firstView:
			return FirstView(frame: .zero, logoConfigurationSource: ConfigurationSource.logoConfigurationSource, textLableConfigurationSource: ConfigurationSource.textLableConfigurationSource, backgroundColorConfigurationSource: ConfigurationSource.backgroundColorConfigurationSource)
		case .secondView:
			return SecondView()
		}
	}

	func scrollViewInit() {

		contentView = initNewUIView(formForInit: self.needUiView, ConfigurationSource: self.configurationSource)

		self.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(contentView)

		contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
		contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	}
}
