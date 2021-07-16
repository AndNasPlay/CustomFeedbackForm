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

public func addNewViewAndScrollView(newView: UIView, newScrollView: MainScrollView, mainView: UIView) {
	mainView.addSubview(newScrollView)
	newScrollView.addSubview(newView)

	newView.translatesAutoresizingMaskIntoConstraints = false
	newScrollView.translatesAutoresizingMaskIntoConstraints = false

	newScrollView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor).isActive = true
	newScrollView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor).isActive = true
	newScrollView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
	newScrollView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true

	newView.topAnchor.constraint(equalTo: newScrollView.topAnchor).isActive = true
	newView.leadingAnchor.constraint(equalTo: newScrollView.leadingAnchor).isActive = true
	newView.trailingAnchor.constraint(equalTo: newScrollView.trailingAnchor).isActive = true
	newView.bottomAnchor.constraint(equalTo: newScrollView.bottomAnchor).isActive = true
	newView.centerXAnchor.constraint(equalTo: newScrollView.centerXAnchor).isActive = true
}
