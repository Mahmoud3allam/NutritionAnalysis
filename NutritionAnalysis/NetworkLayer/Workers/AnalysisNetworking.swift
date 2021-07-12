//
//  AnalysisNetworking.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Alamofire
import Foundation
enum AnalysisNetworking {
    case analize(ingredient: String)
}

extension AnalysisNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .analize:
            return "nutrition-data"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .analize:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .analize(ingredient):
            let parameters: [String: Any] = ["ingr": ingredient, "app_id": NetworkConstant.edamamAppID.rawValue, "app_key": NetworkConstant.edamamApiKey.rawValue]
            return .WithParametersRequest(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
}
