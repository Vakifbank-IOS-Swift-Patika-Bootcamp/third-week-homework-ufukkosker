//
//  AddEmployeeViewControllerDataProvider.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import Foundation

final class AddEmployeeViewControllerDataProvider: AddEmployeeViewControllerDataProviderProtocol {
    
    func addNewEmployee(with model: Employee2, completion: (() -> ())) {
        ZooManager.shared.addNewEmployee(model)
        completion()
    }
    
    func fetchAnimalsWithoutEmployee(completion: (([Animal2]) -> ())) {
        let animals = ZooManager.shared.animals.filter({ $0.employee?.id == nil })
        completion(animals)
    }
    
    func fetchGenders(completion: (([GenderType]) -> ())) {
        let genders = GenderType.allCases
        completion(genders)
    }
    
    func fetchAges(completion: (([Int]) -> ())) {
        let ages = [Int](18...40)
        completion(ages)
    }
    
    func fetchExperienceYears(completion: (([ExperienceYear]) -> ())) {
        completion(ExperienceYear.allCases)
    }
    
    func fetchSalaries(completion: (([SalaryType]) -> ())) {
        completion(SalaryType.allCases)
    }
    
    func searchedAnimalForNewEmployee(with id: String, completion: ((Animal2) -> ())) {
        if let animal = ZooManager.shared.animals.filter({ $0.id == id }).first {
            completion(animal)
        }
    }
    
    func fetchAnimals() {
        
    }
    
    func fetchAnimalsInZoo() {
        
    }
}
