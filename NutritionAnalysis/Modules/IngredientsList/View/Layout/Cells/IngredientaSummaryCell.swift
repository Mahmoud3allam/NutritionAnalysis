//
//  IngredientaSummaryCell.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

class IngredientaSummaryCell: UITableViewCell {
    lazy var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorType.pinkishGrey.value
        return view
    }()

    lazy var ingredientTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorType.text.value
        label.font = UIFont(name: FontTypes.boldFont.name, size: 16)
        label.numberOfLines = 0
        label.text = "Two Apple"
        return label
    }()

    lazy var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()

    lazy var caloriesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorType.text.value
        label.font = UIFont(name: FontTypes.regularFont.name, size: 12)
        label.numberOfLines = 1
        label.text = "Caleories = 20"
        return label
    }()

    lazy var weightLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorType.text.value
        label.font = UIFont(name: FontTypes.regularFont.name, size: 12)
        label.numberOfLines = 1
        label.text = "Weight = 99"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.layoutUserInterFace()
        self.showShimmer()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupContainerViewConstraints()
        self.setupIngredientTitleLabelConstraints()
        self.setupVeritcalStackConstraints()
    }

    private func addSubViews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.ingredientTitleLabel)
        self.containerView.addSubview(self.verticalStackView)
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

    private func setupIngredientTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.ingredientTitleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8),
            self.ingredientTitleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 32),
            self.ingredientTitleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -32)
        ])
    }

    private func setupVeritcalStackConstraints() {
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: self.ingredientTitleLabel.bottomAnchor, constant: 8),
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.ingredientTitleLabel.leadingAnchor, constant: 0),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.ingredientTitleLabel.trailingAnchor),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10)
        ])

        self.verticalStackView.addArrangedSubview(self.weightLabel)
        self.verticalStackView.addArrangedSubview(self.caloriesLabel)
    }

    private func showShimmer() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.subviews.forEach { $0.enableSkeleton(enable: true) }
        }
    }

    private func hideShimmer() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.subviews.forEach { $0.enableSkeleton(enable: false) }
        }
    }
}

extension IngredientaSummaryCell: IngredientaSummaryCellView {
    func setData(data: IngredientResponseModel) {
        self.ingredientTitleLabel.text = data.ingKey ?? ""
        if let calories = data.calories {
            self.caloriesLabel.text = "Calories = " + "\(calories)"
        }
        if let weight = data.totalWeight {
            self.weightLabel.text = "Weight = " + "\(weight)"
        }
        self.hideShimmer()
    }
}
