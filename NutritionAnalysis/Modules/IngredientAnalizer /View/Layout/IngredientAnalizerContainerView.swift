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
    }

    private func addSubViews() {}
}
