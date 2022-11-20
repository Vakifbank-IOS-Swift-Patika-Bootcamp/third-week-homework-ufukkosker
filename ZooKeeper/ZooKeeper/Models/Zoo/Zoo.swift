//
//  Zoo.swift
//  ZooKeeper
//
//  Created by Ufuk on 19.11.2022.
//

import Foundation

class Zoo {
    var id: String = UUID().uuidString
    var totalWaterConsumption: Double
    var totalBudget: Double
    var currentWaterConsumption: Double
    var currentBudget: Double
    var animals: [Animal2]
    var employees: [Employee2]
    
    init(totalWaterConsumption: Double = 0.0, totalBudget: Double = 0.0, currentWaterConsumption: Double = 0.0, currentBudget: Double = 0.0, animals: [Animal2] = [], employees: [Employee2] = []) {
        self.totalWaterConsumption = totalWaterConsumption
        self.totalBudget = totalBudget
        self.currentWaterConsumption = currentWaterConsumption
        self.currentBudget = currentBudget
        self.animals = animals
        self.employees = employees
    }
}
