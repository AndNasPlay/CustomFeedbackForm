//
//  ConfigurationSource.swift
//  Demo
//
//  Created by Андрей Щекатунов on 19.06.2021.
//

import UIKit

public protocol ConfigurationSource {

	var logoConfigurationSource: UIImage { get }

	var textLableConfigurationSource: String { get }

	var backgroundColorConfigurationSource: UIColor { get }
}

public struct ConfigurationSourceStruct {

	var logoConfigurationSource: UIImage 

	var textLableConfigurationSource: String

	var backgroundColorConfigurationSource: UIColor

	var frame: CGRect
}

public class DefauiltConfigurationSource: ConfigurationSource {

	public var logoConfigurationSource: UIImage = UIImage(named: "mailIcon")!

	public var textLableConfigurationSource: String = "Send us a massage"

	public var backgroundColorConfigurationSource: UIColor = .white

	public var frame: CGSize = .zero
}
