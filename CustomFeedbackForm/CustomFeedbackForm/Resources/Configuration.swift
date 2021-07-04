//
//  Configuration.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 04.07.2021.
//

import UIKit

public protocol ConfigurationSource {

	var logoConfigurationSource: UIImage { get }

	var textLableConfigurationSource: String { get }

	var backgroundColorConfigurationSource: UIColor { get }
}
