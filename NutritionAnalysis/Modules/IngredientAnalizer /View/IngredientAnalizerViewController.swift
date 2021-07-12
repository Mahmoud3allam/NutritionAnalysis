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

    private let analizyButton: UIBarButtonItem = {
        var button = UIBarButtonItem(title: "Analize", style: .plain, target: self, action: #selector(didTappedAnalize))
        button.tintColor = .systemBlue
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.setupAnalizeButton()
        self.title = "Ingredient Analizer"
        self.bindContainerViewActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func loadView() {
        super.loadView()
        self.view = containerView
    }

    private func setupAnalizeButton() {
        self.navigationItem.rightBarButtonItems = [analizyButton]
    }

    func bindContainerViewActions() {
        self.containerView.isAnalizeEnabled = { [weak self] isEnabled in
            guard let self = self else {
                return
            }
            self.analizyButton.isEnabled = isEnabled
        }
    }

    @objc func didTappedAnalize() {
        self.presenter.onTapAnalise(with: self.containerView.ingredientTextView.text)
    }
}
