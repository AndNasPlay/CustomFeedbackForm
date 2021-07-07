//
//  PublicFunc.swift
//  Demo
//
//  Created by Андрей Щекатунов on 07.07.2021.
//

import UIKit

public func getFirstViewTetextfieldValue(view: FirstView ) -> FirstAndSecondFeedbackStruct {
	let value: FirstAndSecondFeedbackStruct = FirstAndSecondFeedbackStruct(
		name: view.nameTextField.text ?? "empty",
		email: view.emailTextField.text ?? "empty",
		textMessage: view.textView.text ?? "empty")
	return value
}

public func getSecondViewTetextfieldValue(view: SecondView ) -> FirstAndSecondFeedbackStruct {
	let value: FirstAndSecondFeedbackStruct = FirstAndSecondFeedbackStruct(
		name: view.nameTextField.text ?? "empty",
		email: view.emailTextField.text ?? "empty",
		textMessage: view.textView.text ?? "empty")
	return value
}

public func getThirdViewTetextfieldValue(view: ThirdView ) -> ThirdFeedbackStruct {
	let value: ThirdFeedbackStruct = ThirdFeedbackStruct(
		textMessage: view.textView.text ?? "empty",
		rating: view.ratingStackView.starsRating)
	return value
}
