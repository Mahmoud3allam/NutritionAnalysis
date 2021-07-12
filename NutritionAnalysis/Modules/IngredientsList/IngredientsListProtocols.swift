//
//  IngrediendsListProtocols.swift
//  NutritionAnalysis
//
//  Created Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol IngredientsListViewProtocol: AnyObject {
    var presenter: IngredientsListPresenterProtocol! { get set }

    func showIndicator()
    func hideIndicator()
    func reloadTableView()
}

protocol IngredientsListPresenterProtocol {
    var view: IngredientsListViewProtocol? { get set }

    func viewDidLoad()
    func numberOfRows() -> Int
    func configureCell(cell: IngredientaSummaryCellView, indexPath: IndexPath)
    func onTapTotalNutrationButton()
}

protocol IngredientsListRouterProtocol {
    func navigateToTotalNutrationListScene(with data: [TotalNutrationDisplayableModel])
}

protocol IngredientsListInteractorInPutProtocol {
    var presenter: IngredientsListInteractorOutPutProtocol? { get set }

    func analiseIngredient(ing: String)
}

protocol IngredientsListInteractorOutPutProtocol: AnyObject {
    func sucsessfullyAnalisedIngredient(analisedData: [IngredientResponseModel])
    func failedToAnaliseIngredient(errorMessage: String)
}

protocol IngredientaSummaryCellView {
    func setData(data: IngredientResponseModel)
}
