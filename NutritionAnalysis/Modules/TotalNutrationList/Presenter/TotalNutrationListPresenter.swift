//
//  TotalNutrationListPresenter.swift
//  NutritionAnalysis
//
//  Created Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^

import Foundation
class TotalNutrationListPresenter: TotalNutrationListPresenterProtocol, TotalNutrationListInteractorOutPutProtocol {
    weak var view: TotalNutrationListViewProtocol?
    private let interactor: TotalNutrationListInteractorInPutProtocol
    private let router: TotalNutrationListRouterProtocol
    var totalNutrationData = [TotalNutrationDisplayableModel]()

    init(view: TotalNutrationListViewProtocol, interactor: TotalNutrationListInteractorInPutProtocol, router: TotalNutrationListRouterProtocol, totalNutrationData: [TotalNutrationDisplayableModel]) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.totalNutrationData = totalNutrationData
    }

    func viewDidLoad() {
        print("ViewDidLoad")
    }

    func numberOfRows() -> Int {
        self.totalNutrationData.count
    }

    func configureCell(cell: TotalNutrationCellView, indexPath: IndexPath) {
        guard self.totalNutrationData.count > indexPath.item else {
            return
        }
        cell.setData(data: totalNutrationData[indexPath.item])
    }
}
