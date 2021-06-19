//
//  MainScrollView.swift
//  Demo
//
//  Created by Андрей Щекатунов on 09.06.2021.
//

import UIKit

public enum FeddbackForm: String {
	case firstView
	case secondView

	var newView: MainView {
		switch self {
		case .firstView:
			return FirstView()
		case .secondView:
			return SecondView()
		}
	}
}

class MainScrollView: UIScrollView {

	var contentView: MainView

	init(frame: CGRect, needUiView: FeddbackForm) {
		self.contentView = needUiView.newView
		super.init(frame: frame)
		scrollViewInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func scrollViewInit() {

		self.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(contentView)

		contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
		contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	}
}
