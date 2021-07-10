//
//  IngredientAnalizerViewController.swift
//  NutritionAnalysis
//
//  Created Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class IngredientAnalizerViewController: UIViewController, IngredientAnalizerViewProtocol {
    var presenter: IngredientAnalizerPresenterProtocol!
    lazy var containerView: IngredientAnalizerContainerView = {
        var view = IngredientAnalizerContainerView(presenter: self.presenter)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.title = "Ingredient Analizer"
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }
}
