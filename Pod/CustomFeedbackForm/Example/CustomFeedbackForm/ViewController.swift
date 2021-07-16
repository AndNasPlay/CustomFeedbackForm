//
//  ViewController.swift
//  CustomFeedbackForm
//
//  Created by shchekatunov.av@gmail.com on 07/16/2021.
//  Copyright (c) 2021 shchekatunov.av@gmail.com. All rights reserved.
//

import UIKit
import CustomFeedbackForm

class ViewController: CustomFeedbackForm.MainViewController, CustomFeedbackForm.ViewDelegate {

	var newView: CustomFeedbackForm.MainView = CustomFeedbackForm.FirstView(
		frame: .zero,
		logoConfigurationSource: UIImage(named: "mailIcon")!,
		titleLableConfigurationSource: "Send us a message",
		buttonTitleConfigurationSource: "Send",
		buttonTitleColorConfigurationSource: .white,
		firstButtonColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		secondButtonColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		backgroundColorConfigurationSource: .white
	)

	var sendMessage: CustomFeedbackForm.FirstAndSecondFeedbackStruct?

	override func viewDidLoad() {
		super.viewDidLoad()
		CustomFeedbackForm.addNewViewAndScrollView(newView: newView, newScrollView: newScrollView, mainView: view)
		newView.delegate = self
		view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
	}

	func submit() {
		sendMessage = CustomFeedbackForm.getFirstAndSecondFeedbackStruct(view: newView)
	}
}

