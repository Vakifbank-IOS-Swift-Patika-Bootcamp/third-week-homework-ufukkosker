//
//  AddNewAnimalViewControllerViewModelProtocol.swift
//  ZooKeeper
//
//  Created by Ufuk on 18.11.2022.
//

import Foundation

protocol AddNewAnimalViewControllerViewModelProtocol {
    var floatingTextFieldEmployeeData: [FloatingTextFieldDataModel] { get set }
    var floatingtextFieldGenderData: [FloatingTextFieldDataModel] { get set }
    var floatingtextFieldAnimalData: [FloatingTextFieldDataModel] { get set }
    var floatingTextFieldAgeData: [FloatingTextFieldDataModel] { get set }
    var newAnimal: Animal2 { get set }
    var searchedEmployee: Employee2 { get set }
    var delegate: AddNewAnimalViewControllerDelegate? { get set }
    
    func viewDidLoad()
    func fetchEmployees()
    func fetchAnimals()
    func fetchGenders()
    func fetchAges()
    func searchEmployeeForNewAnimal(with id: String)
    func addNewAnimal()
}


enum AddNewAnimalViewControllerOutput {
    case didAddNewAnimal
}

protocol AddNewAnimalViewControllerDelegate {
    func handle(output: AddNewAnimalViewControllerOutput)
}
