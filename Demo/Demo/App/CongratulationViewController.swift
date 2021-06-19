//
//  CongratulationViewController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import UIKit

class CongratulationViewController: UIViewController, FirstViewDelegate {

	var customView = FirstViewCongratulation()

	override func loadView() {
		customView.delegate = self
		view = customView
	}

	func submit() {
		let firstVC = ViewController()
		navigationController?.pushViewController(firstVC, animated: true)
	}


    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
    }
}
