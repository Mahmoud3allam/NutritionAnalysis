//
//  IngrediendsListContainerView.swift
//  NutritionAnalysis
//
//  Created Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class IngredientsListContainerView: UIView {
    var presenter: IngredientsListPresenterProtocol

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.backgroundColor = .clear
        tableView.register(IngredientaSummaryCell.self, forCellReuseIdentifier: NSStringFromClass(IngredientaSummaryCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    lazy var totalNutrationButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ColorType.buttonsBg.value
        button.setTitle("Total Nutration", for: .normal)
        button.addTarget(self, action: #selector(didTappedTotalNutrationButton), for: .touchUpInside)
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont(name: FontTypes.boldFont.name, size: 18)
        button.tintColor = .white
        return button
    }()

    init(presenter: IngredientsListPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = ColorType.background.value
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupTableViewConstraints()
        self.setupTotalNutrationButtonConstraints()
    }

    private func addSubViews() {
        self.addSubview(self.tableView)
        self.addSubview(self.totalNutrationButton)
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupTotalNutrationButtonConstraints() {
        NSLayoutConstraint.activate([
            self.totalNutrationButton.heightAnchor.constraint(equalToConstant: 60),
            self.totalNutrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.totalNutrationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.totalNutrationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32)
        ])
    }

    @objc func didTappedTotalNutrationButton() {
        self.presenter.onTapTotalNutrationButton()
    }
}
