//
//  TotalNutrationListRouter.swift
//  NutritionAnalysis
//
//  Created Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class TotalNutrationListRouter: TotalNutrationListRouterProtocol {
    weak var viewController: UIViewController?

    static func createAnModule(totalNutrationData: [TotalNutrationDisplayableModel]) -> UIViewController {
        let interactor = TotalNutrationListInteractor()
        let router = TotalNutrationListRouter()
        let view = TotalNutrationListViewController()
        let presenter = TotalNutrationListPresenter(view: view, interactor: interactor, router: router, totalNutrationData: totalNutrationData)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
