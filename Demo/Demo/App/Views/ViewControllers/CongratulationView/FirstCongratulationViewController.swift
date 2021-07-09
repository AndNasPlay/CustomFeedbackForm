//
//  FirstCongratulationViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 07.07.2021.
//

import UIKit

class FirstCongratulationViewController: UIViewController, ViewDelegate {

	var customView = FirstCongratulationView(
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
		customView.delegate = self
		view.backgroundColor = .white
		view.addSubview(customView)
		setupNewView(newView: customView, mainView: view)
	}

	func submit() {
		let viewController = CongratulationViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}
