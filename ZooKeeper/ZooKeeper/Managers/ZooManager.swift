//
//  ZooManager.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation

protocol ZooManagerProtocol {
    var animals: [Animal2] { get set }
    var employees: [Employee2] { get set }
    var zoo: Zoo { get set }
    var isShowAddAnimalButton: Bool { get set }
    
    func addNewAnimal(_ model: Animal2)
    func addNewEmployee(_ model: Employee2)
    func addBudget(price: Double)
    func addWater(water: Double)
    func updateBadgetValue(completion: ((Zoo) -> ()))
    func updatedWaterValue(completion: ((Zoo) -> ()))
}

class ZooManager: ZooManagerProtocol {
    static var shared = ZooManager()
    
    var animals: [Animal2] = []
    var employees: [Employee2] = []
    var zoo: Zoo = Zoo()
    var isShowAddAnimalButton: Bool = false
    
    private init() { }
    
    func addNewAnimal(_ model: Animal2) {
        if let index = employees.firstIndex(where: { $0.id == model.employee?.id}) {
            
            if model.employee?.id != nil {
                employees[index].animals.append(model)
            }
        }
        zoo.currentWaterConsumption -= model.waterConsumption ?? 0.0
        animals.append(model)
    }
    
    func addNewEmployee(_ model: Employee2) {
        let newEmployee = model
        newEmployee.animals.enumerated().forEach { index, item in
            if let index = animals.firstIndex(where: { $0.id == item.id }) {
                animals[index].employee = newEmployee
            }
        }
        model.animals.removeAll()
        employees.append(model)
        zoo.currentBudget -= model.salary ?? 0.0
        isShowAddAnimalButton = true
    }
    
    func addBudget(price: Double) {
        zoo.totalBudget = price
        zoo.currentBudget = price
    }
    
    func addWater(water: Double) {
        zoo.totalWaterConsumption = water
        zoo.currentWaterConsumption = water
        zoo.currentBudget -= water
    }
    
    func updateBadgetValue(completion: ((Zoo) -> ())) {
        completion(zoo)
    }
    
    func updatedWaterValue(completion: ((Zoo) -> ())) {
        completion(zoo)
    }
}
