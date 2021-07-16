//
//  TheThirdViewController.swift
//  CustomFeedbackForm_Example
//
//  Created by Андрей Щекатунов on 16.07.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

import CustomFeedbackForm

class TheThirdViewController: CustomFeedbackForm.MainViewController, CustomFeedbackForm.ViewDelegate {

	var newView: CustomFeedbackForm.MainView = CustomFeedbackForm.TheThirdView(
		frame: .zero,
		productImgConfigurationSource: UIImage(named: "pstcr500")!,
		productNameConfigurationSource: "Card with corgi dog",
		productPridceConfigurationSource: "4 USD",
		subTitleConfigurationSource: "How much was the exact description of the item ?",
		buttonTitleConfigurationSource: "Send",
		buttonFirstColorConfigurationSource: UIColor(named: "blueGradientOne")!,
		buttonSecondColorConfigurationSource: UIColor(named: "blueGradientTwo")!,
		backgroundColorConfigurationSource: .white)
	
	var sendMessage: CustomFeedbackForm.ThirdFeedbackStruct?

	override func viewDidLoad() {
		super.viewDidLoad()
		CustomFeedbackForm.addNewViewAndScrollView(newView: newView, newScrollView: newScrollView, mainView: view)
		newView.delegate = self
		view.backgroundColor = .white
		navigationController?.navigationBar.isHidden = true
	}

	func submit() {
		sendMessage = CustomFeedbackForm.getTheThirdFeedbackStruct(view: newView)
		let viewController = FourthViewController()
		navigationController?.pushViewController(viewController, animated: true)
	}
}
