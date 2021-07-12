//
//  IngredientResponseModel.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation

// MARK: - IngredientReponse

struct IngredientResponseModel: Codable {
    var ingKey: String?
    let uri: String?
    let calories, totalWeight: Int?
    let dietLabels, healthLabels, cautions: [String]?
    let totalNutrients, totalDaily: [String: TotalDaily]?
    let totalNutrientsKCal: TotalNutrientsKCal?
}

@propertyWrapper struct Weight {
    var wrappedValue: String {
        didSet { wrappedValue = "Weight:  " + wrappedValue }
    }

    init(wrappedValue: String) {
        self.wrappedValue = "Weight:  " + wrappedValue
    }
}

// MARK: - TotalDaily

struct TotalDaily: Codable {
    let label: String?
    let quantity: Double?
    let unit: Unit?
}

enum Unit: String, Codable {
    case empty = "%"
    case g
    case kcal
    case mg
    case µg
}

// MARK: - TotalNutrientsKCal

struct TotalNutrientsKCal: Codable {
    let enercKcal, procntKcal, fatKcal, chocdfKcal: TotalDaily?

    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procntKcal = "PROCNT_KCAL"
        case fatKcal = "FAT_KCAL"
        case chocdfKcal = "CHOCDF_KCAL"
    }
}
