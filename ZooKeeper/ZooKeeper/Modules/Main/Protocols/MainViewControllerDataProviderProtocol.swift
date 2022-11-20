//
//  MainViewControllerDataProviderProtocol.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation

protocol MainViewControllerDataProviderProtocol {
    func fetchAllAnimals(completion: (([Animal2]) -> ()))
    func fetchAllEmployees(completion: (([Employee2]) -> ()))
    func fetchBadgetStatus(completion: ((Zoo) -> ()))
    func fetchWaterStatus(completion: ((Zoo) -> ()))
    func addBudget(_ price: Double, completion: (() -> ()))
    func updateBadgetChart(completion: ((Zoo) -> ()))
    func updateWaterChart(completion: ((Zoo) -> ()))
    func addWater(_ lt: Double, completion: (() -> ()))
}
