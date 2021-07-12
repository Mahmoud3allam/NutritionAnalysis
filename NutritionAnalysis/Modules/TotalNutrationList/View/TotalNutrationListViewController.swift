//
//  TotalNutrationListViewController.swift
//  NutritionAnalysis
//
//  Created Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class TotalNutrationListViewController: UIViewController, TotalNutrationListViewProtocol {
    var presenter: TotalNutrationListPresenterProtocol!
    lazy var containerView: TotalNutrationListContainerView = {
        var view = TotalNutrationListContainerView(presenter: self.presenter)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.title = "Total Nutration"
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }
}
