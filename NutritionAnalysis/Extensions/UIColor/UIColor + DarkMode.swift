//
//  UIColor + DarkMode.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return light
        }
        return UIColor {
            switch $0.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }

    static func `init`(color: ColorType) -> UIColor {
        color.value
    }
}
