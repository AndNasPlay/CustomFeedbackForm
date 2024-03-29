//
//  FeedbackStructs.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 04.07.2021.
//

import UIKit

// MARK: This structure for values from all feedback views
public struct UniversalStruct {
	public var name: String
	public var email: String
	public var textMessage: String
	public var rating: Int

	public init(name: String, email: String, textMessage: String, rating: Int) {
		self.name = name
		self.email = email
		self.textMessage = textMessage
		self.rating = rating
	}
}

// MARK: This structure for values from first and second views

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

// MARK: This structure for values from the third view

public struct ThirdFeedbackStruct {
	public var textMessage: String
	public var rating: Int

	public init(textMessage: String, rating: Int) {
		self.textMessage = textMessage
		self.rating = rating
	}
}

// MARK: This structure for values from fourth view

public struct FourthFeedbackStruct {
	public var email: String
	public var textMessage: String

	public init(textMessage: String, email: String) {
		self.email = email
		self.textMessage = textMessage
	}
}
