//
//  IngredientsTransformer.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
protocol IngredientsTransformerProtocol {
    func transform(analisedData: [IngredientResponseModel]) -> [TotalNutrationDisplayableModel]
}

class IngredientTransformer: IngredientsTransformerProtocol {
    func transform(analisedData: [IngredientResponseModel]) -> [TotalNutrationDisplayableModel] {
        var model = [TotalNutrationDisplayableModel]()
        var totalNutritionAnalysis = [[String: Double]]()
        analisedData.forEach { singleData in
            singleData.totalNutrients?.forEach { _, value in
                totalNutritionAnalysis.insert([value.label ?? "": value.quantity ?? 0.0], at: 0)
            }
        }
        let total = totalNutritionAnalysis.flatMap { $0 }.reduce(into: [:]) { $0[$1.key, default: 0] += $1.value }
        total.forEach { key, value in
            model.append(TotalNutrationDisplayableModel(title: key, quantity: String(value)))
        }
        return model
    }
}
