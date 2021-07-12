//
//  IngrediendsListViewController.swift
//  NutritionAnalysis
//
//  Created Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class IngredientsListViewController: UIViewController, IngredientsListViewProtocol {
    var presenter: IngredientsListPresenterProtocol!

    lazy var containerView: IngredientsListContainerView = {
        var view = IngredientsListContainerView(presenter: self.presenter)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.title = "Analizer Result"
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }

    func showIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.view.showActivityIndicator(with: ._default, isUserInteractionEnabled: true, color: ColorType.text.value)
        }
    }

    func hideIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.view.removeActivityIndicator()
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.tableView.reloadData()
        }
    }
}
