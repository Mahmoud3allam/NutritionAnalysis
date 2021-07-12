//
//  TotalNutrationCell.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

class TotalNutrationCell: UITableViewCell {
    lazy var hStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    lazy var title: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorType.text.value
        label.font = UIFont(name: FontTypes.boldFont.name, size: 16)
        label.numberOfLines = 0
        label.text = "Two Apple"
        return label
    }()

    lazy var value: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorType.text.value
        label.font = UIFont(name: FontTypes.regularFont.name, size: 14)
        label.numberOfLines = 0
        label.text = "2309.000001239i921388"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupStackViewConstraints()
    }

    private func addSubViews() {
        self.addSubview(self.hStackView)
    }

    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            self.hStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        self.hStackView.addArrangedSubview(self.title)
        self.hStackView.addArrangedSubview(self.value)
    }
}

extension TotalNutrationCell: TotalNutrationCellView {
    func setData(data: TotalNutrationDisplayableModel) {
        self.title.text = data.title
        self.value.text = data.quantity
    }
}
