//
//  IngredientAnalizerRouter.swift
//  NutritionAnalysis
//
//  Created Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class IngredientAnalizerRouter: IngredientAnalizerRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule() -> UIViewController {
        let interactor = IngredientAnalizerInteractor()
        let router = IngredientAnalizerRouter()
        let view = IngredientAnalizerViewController()
        let presenter = IngredientAnalizerPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }

    func navigateToIngListScene(with ingredient: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let ingredientListScene = IngredientsListRouter.createAnModule(ingredientToAnalize: ingredient)
            self.viewController?.navigationController?.pushViewController(ingredientListScene, animated: true)
        }
    }
}
