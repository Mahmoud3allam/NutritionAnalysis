//
//  LottieIndicator.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

class LottieIndicator: UIView, ActivityIndicatorProtocol {
    lazy var hintLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lottie Indicator"
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.addSubview(self.hintLabel)
        NSLayoutConstraint.activate([
            self.hintLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.hintLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
