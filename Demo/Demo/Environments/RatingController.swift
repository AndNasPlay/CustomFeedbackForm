//
//  RatingController.swift
//  Demo
//
//  Created by Андрей Щекатунов on 07.07.2021.
//

import UIKit

public class RatingController: UIStackView {

	public var starsRating = 0
	var starsEmptyImgName = "iconlyLightStar"
	var starsFilledImgName = "iconlyBoldStar"

	public override func draw(_ rect: CGRect) {
		let starButtons = self.subviews.filter { $0 is UIButton }
		var starTag = 1
		for button in starButtons {
			if let button = button as? UIButton {
				button.setImage(UIImage(named: starsEmptyImgName), for: .normal)
				button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
				button.tag = starTag
				starTag += 1
			}
		}
	   setStarsRating(rating: starsRating)
	}

	public func setStarsRating(rating: Int) {
		self.starsRating = rating
		let stackSubViews = self.subviews.filter { $0 is UIButton }
		for subView in stackSubViews {
			if let button = subView as? UIButton {
				if button.tag > starsRating {
					button.setImage(UIImage(named: starsEmptyImgName), for: .normal)
				} else {
					button.setImage(UIImage(named: starsFilledImgName), for: .normal)
				}
			}
		}
	}

	@objc func pressed(sender: UIButton) {
		setStarsRating(rating: sender.tag)
	}
}
