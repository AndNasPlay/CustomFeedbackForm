//
//  Protocols.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 18.06.2021.
//

import Foundation

public protocol FirstViewDelegate: AnyObject {
	func submit()
}

public protocol SecongViewDelegate: AnyObject {
	func submit()
}
