//
//  AddAnimalViewControllerDataProvider.swift
//  ZooKeeper
//
//  Created by Ufuk on 18.11.2022.
//

import Foundation

final class AddAnimalViewControllerDataProvider: AddAnimalViewControllerDataProviderProtocol {
    
    func addNewAnimal(with model: Animal2, completion: (() -> ())) {
        ZooManager.shared.addNewAnimal(model)
        completion()
    }
    
    func fetchEmployeesWithoutAnimals(completion: (([Employee2]) -> ())) {
        let employees = ZooManager.shared.employees
        let employeesFilter = employees.filter({$0.animals.count == 0})
        completion(employeesFilter)
    }
    
    func fetchAllAnimals(completion: (([AnimalType]) -> ())) {
        let allAnimals = AnimalType.allCases
        completion(allAnimals)
    }
    
    func fetchAllEmployee(completion: (([Employee2]) -> ())) {
        let employees = ZooManager.shared.employees
        completion(employees)
    }
    
    func fetchGenders(completion: (([GenderType]) -> ())) {
        let genders = GenderType.allCases
        completion(genders)
    }
    
    func fetchAges(completion: ([Int]) -> ()) {
        let ages = [Int](0...100)
        completion(ages)
    }
    
    func searchedEmployeeForNewAnimal(with id: String, completion: ((Employee2) -> ())) {
        if let employee = ZooManager.shared.employees.filter({ $0.id == id }).first {
            completion(employee)
        }
    }
}
