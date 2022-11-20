//
//  MainViewControllerDataProvider.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation

final class MainViewControllerDataProvider: MainViewControllerDataProviderProtocol {
    func fetchAllAnimals(completion: (([Animal2]) -> ())) {
        let animals = ZooManager.shared.animals
        completion(animals)
    }
    func fetchAllEmployees(completion: (([Employee2]) -> ())) {
        let employees = ZooManager.shared.employees
        completion(employees)
    }
    func fetchBadgetStatus(completion: ((Zoo) -> ())) {
        let zooStatus = ZooManager.shared.zoo
        completion(zooStatus)
    }
    func fetchWaterStatus(completion: ((Zoo) -> ())) {
        let zooStatus = ZooManager.shared.zoo
        completion(zooStatus)
    }
    func addBudget(_ price: Double, completion: (() -> ())) {
        ZooManager.shared.addBudget(price: price)
        completion()
    }
    func addWater(_ lt: Double, completion: (() -> ())) {
        ZooManager.shared.addWater(water: lt)
        completion()
    }
    func updateBadgetChart(completion: ((Zoo) -> ())) {
        ZooManager.shared.updateBadgetValue { zoo in
            completion(zoo)
        }
    }
    func updateWaterChart(completion: ((Zoo) -> ())) {
        ZooManager.shared.updatedWaterValue { zoo in
            completion(zoo)
        }
    }
}
