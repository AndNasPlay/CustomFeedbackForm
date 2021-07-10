//
//  ConfigurationVIewFunc.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 09.07.2021.
//

import UIKit

// MARK: This func adds constraints for new view without scrollView

public func setupNewView(newView: UIView, mainView: UIView) {
	newView.translatesAutoresizingMaskIntoConstraints = false

	newView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor).isActive = true
	newView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor).isActive = true
	newView.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor).isActive = true
	newView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor).isActive = true
}

// MARK: This function adds a constraints for a new view with a scrollView

public func setupNewViews(newView: UIView, scrollView: UIScrollView, mainView: UIView) {

	newView.translatesAutoresizingMaskIntoConstraints = false

	scrollView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor).isActive = true
	scrollView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor).isActive = true

	scrollView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
	scrollView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true

	newView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
	newView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
	newView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
	newView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
	newView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
}
