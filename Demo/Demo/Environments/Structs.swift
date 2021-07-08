//
//  Structs.swift
//  Demo
//
//  Created by Андрей Щекатунов on 16.06.2021.
//

import UIKit

public struct FirstAndSecondFeedbackStruct {

	public var name: String
	public var email: String
	public var textMessage: String

	public init(name: String, email: String, textMessage: String ) {
		self.name = name
		self.email = email
		self.textMessage = textMessage
	}
}

public struct ThirdFeedbackStruct {

	public var textMessage: String
	public var rating: Int

	public init(textMessage: String, rating: Int) {
		self.textMessage = textMessage
		self.rating = rating
	}
}

public struct FourFeedbackStruct {

	public var email: String
	public var textMessage: String

	public init(textMessage: String, email: String) {
		self.email = email
		self.textMessage = textMessage
	}
}
