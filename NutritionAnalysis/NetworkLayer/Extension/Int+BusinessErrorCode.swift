//
//  Int+BusinessErrorCode.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
extension Int {
    func getAPIRequestResponseBusinessError() -> BaseAPIRequestResponseBusinessErrorType {
        switch self {
        case 20017:
            return .providerError
        default:
            return .providerError
        }
    }
}
