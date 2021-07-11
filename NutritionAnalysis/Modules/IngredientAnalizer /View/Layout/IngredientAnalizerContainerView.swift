//
//  IngredientAnalizerContainerView.swift
//  NutritionAnalysis
//
//  Created Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class IngredientAnalizerContainerView: UIView {
    var presenter: IngredientAnalizerPresenterProtocol

    lazy var ingredientTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = ColorType.text.value
        textView.placeholder = "Enter Your Text Here"
        textView.font = UIFont(name: FontTypes.regularFont.name, size: 15)
        textView.delegate = self
        return textView
    }()

    var isAnalizeEnabled: ((_ isEnabled: Bool) -> Void)?

    init(presenter: IngredientAnalizerPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = ColorType.background.value
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupIngredientTextViewConstraints()
    }

    private func addSubViews() {
        self.addSubview(self.ingredientTextView)
    }

    private func setupIngredientTextViewConstraints() {
        NSLayoutConstraint.activate([
            self.ingredientTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.ingredientTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23),
            self.ingredientTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23),
            self.ingredientTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
    }
}
