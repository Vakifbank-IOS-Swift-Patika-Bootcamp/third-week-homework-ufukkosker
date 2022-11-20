//
//  AddEmployeeViewControllerViewModelProtocol.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import Foundation

protocol AddEmployeeViewControllerViewModelProtocol {
    
    var floatingTextFieldAnimalData: [FloatingTextFieldDataModel] { get set }
    var floatingTextFieldGenderData: [FloatingTextFieldDataModel] { get set }
    var floatingTextFieldAgeData: [FloatingTextFieldDataModel] { get set }
    var floatingTextFieldExperienceData: [FloatingTextFieldDataModel] { get set }
    var floatingTextFieldSalaryData: [FloatingTextFieldDataModel] { get set }
    var newEmployee: Employee2 { get set }
    var searchedAnimal: Animal2 { get set }
    var delegate: AddEmployeeViewControllerDelegate? { get set }
    
    func viewDidLoad()
    func fetchAnimal()
    func fetchGender()
    func fetchAges()
    func fetchExperienceYears()
    func fetchSalaries()
    func searchAnimalForNewEmployee(with id: String)
    func addNewEmployee()
    func calculateSalary(selectedSalary: String?, selectedExperience: String?) -> Double
}

enum AddEmployeeViewControllerOutput {
    case didAddNewEmployee
}

protocol AddEmployeeViewControllerDelegate {
    func handle(output: AddEmployeeViewControllerOutput)
}
