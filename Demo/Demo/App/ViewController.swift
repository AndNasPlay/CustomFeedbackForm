//
//  ViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit
import CustomFeedbackForm

class ViewController: UIViewController, CustomFeedbackForm.FirstViewDelegate {

	func submit() {

	}

	var loadCustomView = CustomFeedbackForm.FirstView()

	override func loadView() {
		loadCustomView.delegate = self
		view = loadCustomView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}
}
