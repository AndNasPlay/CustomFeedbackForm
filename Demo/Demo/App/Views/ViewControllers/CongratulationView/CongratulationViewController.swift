//
//  CongratulationViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit

class CongratulationViewController: UIViewController, ViewDelegate {

	var customView = SecondCongratulationView(
		frame: .zero,
		titleConfigurationSource: "Send us a message",
		subTitleConfigurationSource: "We will get back to you by  email as soon as possible. Thank you!",
		buttonTitleConfigurationSource: "Go back",
		buttonColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
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

	}
}
