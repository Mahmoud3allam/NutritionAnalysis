//
//  ColorTypes.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit
enum ColorType {
    case background
    case text
    case buttonsBg
    case pinkishGrey

    // Here we can provide a color in a light mode and other one for the dark mode system based.
    var value: UIColor {
        switch self {
        case .background:
            return UIColor.dynamicColor(light: .white, dark: #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1))
        case .text:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1), dark: .white)
        case .buttonsBg:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.4666666667, green: 0.5960784314, blue: 0.9529411765, alpha: 1), dark: #colorLiteral(red: 0.4666666667, green: 0.5960784314, blue: 0.9529411765, alpha: 1))
        case .pinkishGrey:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1), dark: .clear)
        }
    }
}
