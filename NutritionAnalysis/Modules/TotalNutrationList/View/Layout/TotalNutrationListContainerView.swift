//
//  TotalNutrationListContainerView.swift
//  NutritionAnalysis
//
//  Created Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class TotalNutrationListContainerView: UIView {
    var presenter: TotalNutrationListPresenterProtocol

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.backgroundColor = .clear
        tableView.register(TotalNutrationCell.self, forCellReuseIdentifier: NSStringFromClass(TotalNutrationCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    init(presenter: TotalNutrationListPresenterProtocol) {
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
    }

    private func addSubViews() {
        self.addSubview(self.tableView)
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
