//
//  SecondViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit
import CustomFeedbackForm

class SecondViewController: CustomFeedbackForm.MainViewController, CustomFeedbackForm.ViewDelegate {

	var newView: CustomFeedbackForm.MainView = CustomFeedbackForm.SecondView(
		frame: .zero,
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
		let viewController = SecondCongratulationViewController()
		navigationController?.pushViewController(viewController, animated: true)
	}
}
