//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by Андрей Щекатунов on 01.06.2021.
//

import XCTest

class DemoUITests: XCTestCase {

	func testAllViews() throws {
		let app = XCUIApplication()
		app.launch()
		let firstView = app.otherElements["firstView"].firstMatch
		let firstViewNameTF = firstView.textFields["nameTextField"]
		firstViewNameTF.tap()
		firstViewNameTF.typeText("John Doe")
		writeInTheEmailTextFields(element: firstView)
		let firstViewTextTF = firstView.textViews["textView"]
		firstViewTextTF.tap()
		firstViewTextTF.typeText("Good job!")
		buttonTap(element: firstView)

		let firstCongratulationView = app.otherElements["firstCongratulationView"].firstMatch
		buttonTap(element: firstCongratulationView)

		let secondView = app.otherElements["secondView"].firstMatch
		let secondViewNameTF = secondView.textFields["nameTextField"]
		secondViewNameTF.tap()
		secondViewNameTF.typeText("John Doe")
		writeInTheEmailTextFields(element: secondView)
		let secondViewTextTF = secondView.textViews["textView"]
		secondViewTextTF.tap()
		secondViewTextTF.typeText("Good job!")
		buttonTap(element: secondView)

		let secondCongratulationView = app.otherElements["secondCongratulationView"].firstMatch
		buttonTap(element: secondCongratulationView)

		let theThirdView = app.otherElements["theThirdView"].firstMatch
		let theThirdViewRating = theThirdView.buttons["fourStars"]
		theThirdViewRating.tap()
		let theThirdViewTextTF = theThirdView.textViews["textView"]
		theThirdViewTextTF.tap()
		theThirdViewTextTF.typeText("Great postcard! Good print quality!")
		buttonTap(element: theThirdView)

		let fourView = app.otherElements["fourView"].firstMatch
		writeInTheEmailTextFields(element: fourView)
		let fourViewViewTextTF = fourView.textViews["textView"]
		fourViewViewTextTF.tap()
		fourViewViewTextTF.typeText("Nice app!")
		buttonTap(element: fourView)
	}

	func buttonTap(element: XCUIElement) {
		let sendButton = element.buttons["button"]
		sendButton.tap()
	}

	func writeInTheEmailTextFields(element: XCUIElement) {
		let emailTF = element.textFields["emailTextField"]
		emailTF.tap()
		emailTF.typeText("JohnDoe@gmail.com")
	}
}
