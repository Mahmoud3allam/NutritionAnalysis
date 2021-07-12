//
//  AnalysisWorker.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
protocol AnalysisWorkerProtocol {
    func analize(ingredient: String, completion: @escaping (Swift.Result<IngredientResponseModel?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class AnalysisWorker: APIRequestExecuter<AnalysisNetworking>, AnalysisWorkerProtocol {
    func analize(ingredient: String, completion: @escaping (Result<IngredientResponseModel?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .analize(ingredient: ingredient), responseClass: IngredientResponseModel.self) { results in
            completion(results)
        }
    }
}
