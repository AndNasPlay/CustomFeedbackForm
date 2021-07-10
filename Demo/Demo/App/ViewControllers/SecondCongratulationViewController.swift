//
//  SecondCongratulationViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit
import CustomFeedbackForm

class SecondCongratulationViewController: UIViewController, CustomFeedbackForm.ViewDelegate {

	var newView = CustomFeedbackForm.SecondCongratulationView(
		frame: .zero,
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
		let viewController = TheThirdViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}
