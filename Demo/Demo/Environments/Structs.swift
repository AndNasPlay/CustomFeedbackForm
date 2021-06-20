//
//  Structs.swift
//  Demo
//
//  Created by Андрей Щекатунов on 16.06.2021.
//

import UIKit

public enum ViewStructs: String {
	case firstView
	case secondView
}

public struct viewStruct {
	var name: String!
	var email: String!
	var textMassage: String!
	var rating: Int?
}

public struct configurationSourceStruct {
	var logoConfigurationSource: UIImage
	var textLableConfigurationSource: String
	var backgroundColorConfigurationSource: UIColor
}
