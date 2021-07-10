//
//  IngredientAnalizerProtocols.swift
//  NutritionAnalysis
//
//  Created Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol IngredientAnalizerViewProtocol: AnyObject {
    var presenter: IngredientAnalizerPresenterProtocol! { get set }
}

protocol IngredientAnalizerPresenterProtocol {
    var view: IngredientAnalizerViewProtocol? { get set }

    func viewDidLoad()
}

protocol IngredientAnalizerRouterProtocol {}

protocol IngredientAnalizerInteractorInPutProtocol {
    var presenter: IngredientAnalizerInteractorOutPutProtocol? { get set }
}

protocol IngredientAnalizerInteractorOutPutProtocol: AnyObject {}
