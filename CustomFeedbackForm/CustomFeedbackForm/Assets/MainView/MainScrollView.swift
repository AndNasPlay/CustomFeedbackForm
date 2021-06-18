//
//  MainScrollView.swift
//  CustomFeedbackForm
//
//  Created by Андрей Щекатунов on 18.06.2021.
//

import UIKit

public enum FeddbackForm: String {
	case firstView
	case secondView
}

public class MainScrollView: UIScrollView {

	public var needUiView: FeddbackForm

	public init(frame: CGRect, needUiView: FeddbackForm) {
		self.needUiView = needUiView
		super.init(frame: frame)
		scrollViewInit()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public var contentView: MainView = FirstView()

	func uIViewChoice(test: FeddbackForm) {
		switch test {
		case .firstView:
			contentView = FirstView()
		case .secondView:
			contentView = SecondView()
		}
	}

	func scrollViewInit() {
		uIViewChoice(test: needUiView)

		self.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(contentView)
		
		contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
		contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	}
}
