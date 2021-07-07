//
//  GradientButton.swift
//  Demo
//
//  Created by Андрей Щекатунов on 17.06.2021.
//

import UIKit

class GradientButton: UIButton {

	let gradient = CAGradientLayer()

	init(colors: [CGColor]) {
		super.init(frame: .zero)
		gradient.frame = bounds
		gradient.colors = colors
		layer.addSublayer(gradient)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		gradient.frame = bounds
	}
}
