//
//  BaseAPIRequestResponseBusinessErrorType.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation

enum BaseAPIRequestResponseBusinessErrorType: Error {
    case providerError
    var message: String {
        switch self {
        case .providerError:
            return "There's an error from the provider , please try again later."
        }
    }
}
