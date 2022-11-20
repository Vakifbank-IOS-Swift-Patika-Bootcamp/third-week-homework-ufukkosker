//
//  AddAnimalViewControllerViewModel.swift
//  ZooKeeper
//
//  Created by Ufuk on 18.11.2022.
//

import Foundation

final class AddAnimalViewControllerViewModel: AddNewAnimalViewControllerViewModelProtocol {
    
    var floatingTextFieldEmployeeData: [FloatingTextFieldDataModel] = []
    var floatingtextFieldGenderData: [FloatingTextFieldDataModel] = []
    var floatingTextFieldAgeData: [FloatingTextFieldDataModel] = []
    var floatingtextFieldAnimalData: [FloatingTextFieldDataModel] = []
    var newAnimal: Animal2 = Animal2()
    var searchedEmployee: Employee2 = Employee2()
    var delegate: AddNewAnimalViewControllerDelegate?
    private let dataProvider: AddAnimalViewControllerDataProviderProtocol
    
    init(dataProvider: AddAnimalViewControllerDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        fetchEmployees()
        fetchAnimals()
        fetchGenders()
        fetchAges()
    }
    
    func fetchEmployees() {
        dataProvider.fetchEmployeesWithoutAnimals { employees in
            self.floatingTextFieldEmployeeData.append(contentsOf: employees.map{ prepareFloatingTextFieldDataForAllEmployees(employee: $0) })
        }
    }
    
    func fetchAnimals() {
        dataProvider.fetchAllAnimals { animals in
            self.floatingtextFieldAnimalData.append(contentsOf: animals.map{ prepareFloatingTextFieldDataForAllAnimals(animal: $0) })
        }
    }
    
    func fetchGenders() {
        dataProvider.fetchGenders { genders in
            self.floatingtextFieldGenderData.append(contentsOf: genders.map{ prepareFloatingTextFieldDataForAllGenders(gender: $0) })
        }
    }
    
    func fetchAges() {
        dataProvider.fetchAges { ages in
            self.floatingTextFieldAgeData.append(contentsOf: ages.map{ prepareFloatingTextFieldDataForAllAges(age: $0) })
        }
    }
    
    func addNewAnimal() {        
        newAnimal.employee = searchedEmployee
        dataProvider.addNewAnimal(with: newAnimal) {
            notify(.didAddNewAnimal)
        }
    }
    
    func searchEmployeeForNewAnimal(with id: String) {
        dataProvider.searchedEmployeeForNewAnimal(with: id) { employee in
            self.searchedEmployee = employee
        }
    }
    
    private func prepareFloatingTextFieldDataForAllEmployees(employee: Employee2) -> FloatingTextFieldDataModel {
        .init(firstItem: employee.name ?? "", secondItem: employee.lastName ?? "", thirdItem: employee.id ?? "")
    }
    
    private func prepareFloatingTextFieldDataForAllGenders(gender: GenderType) -> FloatingTextFieldDataModel {
        .init(firstItem: gender.rawValue, secondItem: gender.genderIconForAnimal)
    }
    
    private func prepareFloatingTextFieldDataForAllAges(age: Int) -> FloatingTextFieldDataModel {
        .init(firstItem: String(age))
    }
    
    private func prepareFloatingTextFieldDataForAllAnimals(animal: AnimalType) -> FloatingTextFieldDataModel {
        .init(firstItem: animal.rawValue, secondItem: animal.animalIcon ?? "")
    }
    
    private func notify(_ output: AddNewAnimalViewControllerOutput) {
        delegate?.handle(output: output)
    }
}
