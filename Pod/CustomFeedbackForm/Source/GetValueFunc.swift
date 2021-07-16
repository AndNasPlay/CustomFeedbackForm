//
//  GetValueFunc.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit

// MARK: This function takes values ​​from textFields (textView) and returns a UniversalStruct

func getTextfieldValue(view: MainView) -> UniversalStruct {
	var value: UniversalStruct
	if view.isKind(of: FirstView.self) {
		value = UniversalStruct(
			name: (view as? FirstView)!.nameTextField.text ?? "empty",
			email: (view as? FirstView)!.emailTextField.text ?? "empty",
			textMessage: (view as? FirstView)!.textView.text ?? "empty",
			rating: 0)
		return value
	} else if view.isKind(of: SecondView.self) {
		value = UniversalStruct(
			name: (view as? SecondView)!.nameTextField.text ?? "empty",
			email: (view as? SecondView)!.emailTextField.text ?? "empty",
			textMessage: (view as? SecondView)!.textView.text ?? "empty",
			rating: 0)
		return value
	} else if view.isKind(of: TheThirdView.self) {
		value = UniversalStruct(
			name: "empty",
			email: "empty",
			textMessage: (view as? TheThirdView)!.textView.text ?? "empty",
			rating: (view as? TheThirdView)!.ratingStackView.starsRating)
		return value
	} else if view.isKind(of: FourthView.self) {
		value = UniversalStruct(
			name: "empty",
			email: (view as? FourthView)!.emailTextField.text ?? "empty",
			textMessage: (view as? FourthView)!.textView.text ?? "empty",
			rating: 0)
		return value
	} else {
		return UniversalStruct(name: "empty", email: "empty", textMessage: "empty", rating: 0)
	}
}

// MARK: Takes values ​​from getTextfieldValue (UniversalStruct) and returns a struct for the first and second views

func convertingUniversalStructToFirstAndSecondStruct(value: UniversalStruct) -> FirstAndSecondFeedbackStruct {
	let value: FirstAndSecondFeedbackStruct = FirstAndSecondFeedbackStruct(
		name: value.name,
		email: value.email,
		textMessage: value.textMessage)
	return value
}

// MARK: Takes values ​​from getTextfieldValue (UniversalStruct) and return a struct for the third view

func convertingUniversalStructToThirdFeedbackStruct(value: UniversalStruct) -> ThirdFeedbackStruct {
	let value: ThirdFeedbackStruct = ThirdFeedbackStruct(
		textMessage: value.textMessage,
		rating: value.rating)
	return value
}

// MARK: Takes values ​​from getTextfieldValue (UniversalStruct) and return a struct for the fourth view

func convertingUniversalStructToFourthFeedbackStruct(value: UniversalStruct) -> FourthFeedbackStruct {
	let value: FourthFeedbackStruct = FourthFeedbackStruct(
		textMessage: value.textMessage,
		email: value.email)
	return value
}

// MARK: Takes values ​​from first and second views (MainView) and returns a struct for the first and second views

public func getFirstAndSecondFeedbackStruct(view: MainView) -> FirstAndSecondFeedbackStruct {
	convertingUniversalStructToFirstAndSecondStruct(value: getTextfieldValue(view: view))
}

// MARK: This functions takes values ​​from the third view (MainView) and return a struct

public func getTheThirdFeedbackStruct(view: MainView) -> ThirdFeedbackStruct {
	convertingUniversalStructToThirdFeedbackStruct(value: getTextfieldValue(view: view))
}

// MARK: This functions takes values ​​from the fourth view (MainView) and return a struct

public func getFourthFeedbackStruct(view: MainView) -> FourthFeedbackStruct {
	convertingUniversalStructToFourthFeedbackStruct(value: getTextfieldValue(view: view))
}
