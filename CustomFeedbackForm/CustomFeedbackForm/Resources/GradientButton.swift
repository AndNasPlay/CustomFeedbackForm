//
//  GradientButton.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 18.06.2021.
//

import UIKit

public class GradientButton: UIButton {

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

	public override func layoutSubviews() {
		super.layoutSubviews()
		gradient.frame = bounds
	}
}
