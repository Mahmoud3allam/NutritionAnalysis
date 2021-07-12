//
//  UIView + Indicator.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

// fileprivate var aView: Indicatable?
// A protocol that any indicator view should conform to
protocol ActivityIndicatorProtocol: UIView {}

enum ActivityIndicatorType {
    case _default
    case lottie
}

extension UIView {
    func showActivityIndicator(with type: ActivityIndicatorType, isUserInteractionEnabled: Bool = false, frame: CGRect = .zero, color: UIColor = .white) {
        let activityInticator = self.setupActivityIndicatorType(type, color: color)
        self.setupActivityIndicatorViewFrame(activityInticator: activityInticator, frame: frame)
        self.addSubview(activityInticator)
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }

    func removeActivityIndicator() {
        let indicatorView = self.subviews.filter { $0 is ActivityIndicatorProtocol }
        indicatorView.first?.removeFromSuperview()
        self.isUserInteractionEnabled = true
    }

    private func setupActivityIndicatorType(_ type: ActivityIndicatorType, color: UIColor) -> ActivityIndicatorProtocol {
        type == ._default ? NormalIndicator(color: color) : LottieIndicator()
    }

    private func setupActivityIndicatorViewFrame(activityInticator: ActivityIndicatorProtocol, frame: CGRect) {
        if frame != .zero {
            activityInticator.frame = frame
        } else {
            activityInticator.frame = self.bounds
        }
    }
}
