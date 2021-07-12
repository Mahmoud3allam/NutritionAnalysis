//
//  TotalNutrationListProtocols.swift
//  NutritionAnalysis
//
//  Created Alchemist on 12/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation
protocol TotalNutrationListViewProtocol: AnyObject {
    var presenter: TotalNutrationListPresenterProtocol! { get set }
}

protocol TotalNutrationListPresenterProtocol {
    var view: TotalNutrationListViewProtocol? { get set }

    func viewDidLoad()
    func numberOfRows() -> Int
    func configureCell(cell: TotalNutrationCellView, indexPath: IndexPath)
}

protocol TotalNutrationListRouterProtocol {}

protocol TotalNutrationListInteractorInPutProtocol {
    var presenter: TotalNutrationListInteractorOutPutProtocol? { get set }
}

protocol TotalNutrationListInteractorOutPutProtocol: AnyObject {}

protocol TotalNutrationCellView {
    func setData(data: TotalNutrationDisplayableModel)
}
