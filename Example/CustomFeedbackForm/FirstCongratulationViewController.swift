//
//  FirstCongratulationViewController.swift
//  CustomFeedbackForm_Example
//
//  Created by Андрей Щекатунов on 16.07.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import CustomFeedbackForm

class FirstCongratulationViewController: UIViewController, CustomFeedbackForm.ViewDelegate {

	var newView = CustomFeedbackForm.FirstCongratulationView(
		frame: .zero,
		logoConfigurationSource: UIImage(named: "mailbx")!,
		titleConfigurationSource: "Send us a message",
		subTitleConfigurationSource: "We will get back to you by  email as soon as possible. Thank you!",
		buttonTitleConfigurationSource: "Send",
		buttonFirstColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		buttonSecondColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		backgroundColorConfigurationSource: .white)

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		newView.delegate = self
		view.backgroundColor = .white
		view.addSubview(newView)
		setupNewView(newView: newView, mainView: view)
	}

	func submit() {
		let viewController = SecondViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}
