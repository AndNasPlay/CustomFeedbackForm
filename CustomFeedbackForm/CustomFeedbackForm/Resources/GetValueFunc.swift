//
//  GetValueFunc.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit

// MARK: This function takes values ​​from textFields (textView) and returns a structure for first view

public func getFirstViewTetextfieldValue(view: FirstView ) -> FirstAndSecondFeedbackStruct {
	let value: FirstAndSecondFeedbackStruct = FirstAndSecondFeedbackStruct(
		name: view.nameTextField.text ?? "empty",
		email: view.emailTextField.text ?? "empty",
		textMessage: view.textView.text ?? "empty")
	return value
}

// MARK: This function takes values ​​from textFields (textView) and returns a structure for second view

public func getSecondViewTetextfieldValue(view: SecondView ) -> FirstAndSecondFeedbackStruct {
	let value: FirstAndSecondFeedbackStruct = FirstAndSecondFeedbackStruct(
		name: view.nameTextField.text ?? "empty",
		email: view.emailTextField.text ?? "empty",
		textMessage: view.textView.text ?? "empty")
	return value
}

// MARK: This function takes values ​​from textFields (textView) and returns a structure for the third view

public func getTheThirdViewTetextfieldValue(view: TheThirdView ) -> ThirdFeedbackStruct {
	let value: ThirdFeedbackStruct = ThirdFeedbackStruct(
		textMessage: view.textView.text ?? "empty",
		rating: view.ratingStackView.starsRating)
	return value
}

// MARK: This function takes values ​​from textFields (textView) and returns a structure for four view

public func getFourViewTetextfieldValue(view: FourView ) -> FourFeedbackStruct {
	let value: FourFeedbackStruct = FourFeedbackStruct(
		textMessage: view.textView.text ?? "empty",
		email: view.emailTextField.text ?? "empty")
	return value
}
