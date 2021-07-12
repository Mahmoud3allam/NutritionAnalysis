//
//  IngredientsListContainerView + UITableView.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

extension IngredientsListContainerView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        self.presenter.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(IngredientaSummaryCell.self), for: indexPath) as? IngredientaSummaryCell else {
            return UITableViewCell()
        }
        self.presenter.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
