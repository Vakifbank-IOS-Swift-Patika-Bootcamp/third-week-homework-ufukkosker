//
//  AddEmployeeViewControllerDataProviderProtocol.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import Foundation

protocol AddEmployeeViewControllerDataProviderProtocol {
    func addNewEmployee(with model: Employee2, completion: (() -> ()))
    func fetchAnimalsWithoutEmployee(completion: (([Animal2]) -> ()))
    func fetchGenders(completion: (([GenderType]) -> ()))
    func fetchAges(completion: (([Int]) -> ()))
    func fetchExperienceYears(completion: (([ExperienceYear]) -> ()))
    func fetchSalaries(completion: (([SalaryType]) -> ()))
    func searchedAnimalForNewEmployee(with id: String, completion: ((Animal2) -> ()))
    func fetchAnimalsInZoo()
}
