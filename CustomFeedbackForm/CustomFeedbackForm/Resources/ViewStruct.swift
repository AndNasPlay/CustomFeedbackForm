//
//  ViewStruct.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 04.07.2021.
//

import UIKit

public struct viewStruct {
	public var name: String!
	public var email: String!
	public var textMassage: String!
	public var rating: Int?
}

public struct configurationSourceStruct {
	var logoConfigurationSource: UIImage
	var textLableConfigurationSource: String
	var backgroundColorConfigurationSource: UIColor

	public init(logoConfigurationSource: UIImage, textLableConfigurationSource: String, backgroundColorConfigurationSource: UIColor ) {
		self.logoConfigurationSource = logoConfigurationSource
		self.textLableConfigurationSource = textLableConfigurationSource
		self.backgroundColorConfigurationSource = backgroundColorConfigurationSource
	}
}
