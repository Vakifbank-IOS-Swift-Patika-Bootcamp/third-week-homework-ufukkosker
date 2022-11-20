//
//  AddAnimalViewControllerDataProviderProtocol.swift
//  ZooKeeper
//
//  Created by Ufuk on 18.11.2022.
//

import Foundation

protocol AddAnimalViewControllerDataProviderProtocol {
    func addNewAnimal(with model: Animal2, completion: (() -> ()))
    func fetchAllAnimals(completion: (([AnimalType]) -> ()))
    func fetchEmployeesWithoutAnimals(completion: (([Employee2]) -> ()))
    func fetchGenders(completion: (([GenderType]) -> ()))
    func fetchAges(completion: ([Int]) -> ())
    func searchedEmployeeForNewAnimal(with id: String, completion: ((Employee2) -> ()))
}
