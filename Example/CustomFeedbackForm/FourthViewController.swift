//
//  FourthViewController.swift
//  CustomFeedbackForm_Example
//
//  Created by Андрей Щекатунов on 16.07.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import CustomFeedbackForm

class FourthViewController: CustomFeedbackForm.MainViewController, CustomFeedbackForm.ViewDelegate {

	var newView = CustomFeedbackForm.FourthView(
		frame: .zero,
		logoConfigurationSource: UIImage(named: "mailIcon")!,
		titleLableConfigurationSource: "Send us a message",
		buttonTitleConfigurationSource: "Send",
		buttonTitleColorConfigurationSource: .white,
		firstButtonColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		secondButtonColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		backgroundColorConfigurationSource: .white)

	var sendMessage: CustomFeedbackForm.FourthFeedbackStruct?

	override func viewDidLoad() {
		super.viewDidLoad()
		CustomFeedbackForm.addNewViewAndScrollView(newView: newView, newScrollView: newScrollView, mainView: view)
		newView.delegate = self
		view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
	}

	func submit() {
		sendMessage = CustomFeedbackForm.getFourthFeedbackStruct(view: newView)
		let viewController = ViewController()
		navigationController?.pushViewController(viewController, animated: true)
	}
}
