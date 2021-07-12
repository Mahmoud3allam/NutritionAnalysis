//
//  IngredientAnalizerPresenter.swift
//  NutritionAnalysis
//
//  Created Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class IngredientAnalizerPresenter: IngredientAnalizerPresenterProtocol, IngredientAnalizerInteractorOutPutProtocol {
    weak var view: IngredientAnalizerViewProtocol?
    private let interactor: IngredientAnalizerInteractorInPutProtocol
    private let router: IngredientAnalizerRouterProtocol

    init(view: IngredientAnalizerViewProtocol, interactor: IngredientAnalizerInteractorInPutProtocol, router: IngredientAnalizerRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }

    func onTapAnalise(with ingredient: String) {
        self.router.navigateToIngListScene(with: ingredient)
    }
}
