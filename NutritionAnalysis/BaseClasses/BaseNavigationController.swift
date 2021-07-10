//
//  BaseNavigationController.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit
class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBarBehaviors()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }

    private func setupNavigationBarBehaviors() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.backgroundColor = ColorType.background.value
        self.navigationBar.barTintColor = ColorType.background.value
        self.navigationBar.tintColor = ColorType.text.value
        self.navigationBar.isTranslucent = false
        let textAttributeWhenSmallTitle = [NSAttributedString.Key.foregroundColor: ColorType.text.value, NSAttributedString.Key.font: UIFont(name: FontTypes.boldFont.name, size: 20)]
        self.navigationBar.titleTextAttributes = textAttributeWhenSmallTitle as [NSAttributedString.Key: Any]
        let textAttributeWhenLargeTitle = [NSAttributedString.Key.foregroundColor: ColorType.text.value, NSAttributedString.Key.font: UIFont(name: FontTypes.boldFont.name, size: 20)]
        self.navigationBar.largeTitleTextAttributes = textAttributeWhenLargeTitle as [NSAttributedString.Key: Any]
        self.setStatusBarBackGroundColor(withColor: ColorType.background.value)
    }
}
