//
//  IngrediendsListPresenter.swift
//  NutritionAnalysis
//
//  Created Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class IngredientsListPresenter: IngredientsListPresenterProtocol, IngredientsListInteractorOutPutProtocol {
    weak var view: IngredientsListViewProtocol?
    private let interactor: IngredientsListInteractorInPutProtocol
    private let router: IngredientsListRouterProtocol
    var ingredientToAnalize: String
    var analizedData = [IngredientResponseModel]()
    var isLoadedDataOnce: Bool = false
    private let ingredientTransformer: IngredientsTransformerProtocol = IngredientTransformer()

    init(view: IngredientsListViewProtocol, interactor: IngredientsListInteractorInPutProtocol, router: IngredientsListRouterProtocol, ingredientToAnalize: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.ingredientToAnalize = ingredientToAnalize
    }

    func viewDidLoad() {
        print("ViewDidLoad")
        self.interactor.analiseIngredient(ing: self.ingredientToAnalize)
    }

    func numberOfRows() -> Int {
        if isLoadedDataOnce {
            if self.analizedData.count == 0 {
                // Show Place Holder
            }
            return self.analizedData.count
        } else {
            return 3
        }
    }

    func configureCell(cell: IngredientaSummaryCellView, indexPath: IndexPath) {
        guard self.analizedData.count > indexPath.item else {
            return
        }
        cell.setData(data: self.analizedData[indexPath.item])
    }

    func sucsessfullyAnalisedIngredient(analisedData: [IngredientResponseModel]) {
        self.isLoadedDataOnce = true
        self.analizedData = analisedData

        self.view?.reloadTableView()
    }

    func failedToAnaliseIngredient(errorMessage: String) {
        self.isLoadedDataOnce = true
        print(errorMessage)
    }

    func onTapTotalNutrationButton() {
        let nutrationData = self.ingredientTransformer.transform(analisedData: self.analizedData)
        self.router.navigateToTotalNutrationListScene(with: nutrationData)
    }
}
