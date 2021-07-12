//
//  IngrediendsListRouter.swift
//  NutritionAnalysis
//
//  Created Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class IngredientsListRouter: IngredientsListRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule(ingredientToAnalize: String) -> UIViewController {
        let interactor = IngredientsListInteractor()
        let router = IngredientsListRouter()
        let view = IngredientsListViewController()
        let presenter = IngredientsListPresenter(view: view, interactor: interactor, router: router, ingredientToAnalize: ingredientToAnalize)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

    func navigateToTotalNutrationListScene(with data: [TotalNutrationDisplayableModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let totalNutrationScene = TotalNutrationListRouter.createAnModule(totalNutrationData: data)
            self.viewController?.navigationController?.pushViewController(totalNutrationScene, animated: true)
        }
    }
}
