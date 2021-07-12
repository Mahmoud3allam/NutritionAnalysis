//
//  IngrediendsListInteractor.swift
//  NutritionAnalysis
//
//  Created Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
class IngredientsListInteractor: IngredientsListInteractorInPutProtocol {
    weak var presenter: IngredientsListInteractorOutPutProtocol?
    private let analysisWorker: AnalysisWorkerProtocol = AnalysisWorker()
    private let dispatchGroup = DispatchGroup()

    func analiseIngredient(ing: String) {
        let ingredientsToAnalise = ing.split(separator: "\n").map { String($0) }
        var analizedIngredients = [IngredientResponseModel]()

        ingredientsToAnalise.forEach { signleIng in
            dispatchGroup.enter()
            self.analysisWorker.analize(ingredient: signleIng) { [weak self] results in
                guard let self = self else {
                    return
                }
                switch results {
                case let .success(analisedData):
                    if let unwrappedData = analisedData {
                        analizedIngredients.append(unwrappedData)
                        self.dispatchGroup.leave()
                    } else {
                        self.presenter?.failedToAnaliseIngredient(errorMessage: "Can't reach analized data , please try again later")
                        self.dispatchGroup.leave()
                    }
                case let .failure(error):
                    self.presenter?.failedToAnaliseIngredient(errorMessage: error.message)
                    self.dispatchGroup.leave()
                }
            }
        }

        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else {
                return
            }
            print("All Requests Done")
            print(analizedIngredients.count)
            guard analizedIngredients.count == ingredientsToAnalise.count else {
                self.presenter?.failedToAnaliseIngredient(errorMessage: "Can't reach analized data , please try again later")
                return
            }
            for (index, value) in ingredientsToAnalise.enumerated() {
                analizedIngredients[index].ingKey = value
            }
            self.presenter?.sucsessfullyAnalisedIngredient(analisedData: analizedIngredients)
        }
    }
}
