//
//  AddEmployeeViewControllerViewModel.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import Foundation

final class AddEmployeeViewControllerViewModel: AddEmployeeViewControllerViewModelProtocol {

    var floatingTextFieldAgeData: [FloatingTextFieldDataModel] = []
    var floatingTextFieldAnimalData: [FloatingTextFieldDataModel] = []
    var floatingTextFieldGenderData: [FloatingTextFieldDataModel] = []
    var floatingTextFieldExperienceData: [FloatingTextFieldDataModel] = []
    var floatingTextFieldSalaryData: [FloatingTextFieldDataModel] = []
    var newEmployee: Employee2 = Employee2()
    var searchedAnimal: Animal2 = Animal2()
    var delegate: AddEmployeeViewControllerDelegate?
    private let dataProvider: AddEmployeeViewControllerDataProviderProtocol
    
    init(dataProvider: AddEmployeeViewControllerDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        fetchAnimal()
        fetchGender()
        fetchAges()
        fetchExperienceYears()
        fetchSalaries()
    }
    
    func fetchAnimal() {
        dataProvider.fetchAnimalsWithoutEmployee { animals in
            self.floatingTextFieldAnimalData.append(contentsOf: animals.map{ prepareFloatingTextFieldDataForAllAnimal(animal: $0) })
        }
    }
    
    func fetchGender() {
        dataProvider.fetchGenders { genders in
            self.floatingTextFieldGenderData.append(contentsOf: genders.map{ prepareFloatingTextFieldDataForGender(gender: $0) })
        }
    }
    
    func fetchAges() {
        dataProvider.fetchAges { ages in
            self.floatingTextFieldAgeData.append(contentsOf: ages.map{ prepareFloatingTextFieldDataForAges(age: $0) })
        }
    }
    
    func fetchExperienceYears() {
        dataProvider.fetchExperienceYears { experienceYears in
            self.floatingTextFieldExperienceData.append(contentsOf: experienceYears.map{ prepareFloatingTextFieldDataForExperienceYears(year: $0) })
        }
    }
    
    func fetchSalaries() {
        dataProvider.fetchSalaries { salaries in
            self.floatingTextFieldSalaryData.append(contentsOf: salaries.map{ prepareFloatingTextFieldDataForExperienceSalaries(salary: $0) })
        }
    }
    
    func addNewEmployee() {
        newEmployee.animals.append(searchedAnimal)
        dataProvider.addNewEmployee(with: newEmployee) {
            notify(.didAddNewEmployee)
        }
    }
    
    func searchAnimalForNewEmployee(with id: String) {
        dataProvider.searchedAnimalForNewEmployee(with: id) { animal in
            self.searchedAnimal = animal
        }
    }
    
    func calculateSalary(selectedSalary: String?, selectedExperience: String?) -> Double {
        guard let selectedSalary = Double(selectedSalary ?? ""),
              let selectedExperience = ExperienceYear(rawValue: selectedExperience ?? "")?.salaryRation
        else { return 0.0 }
        return selectedSalary * selectedExperience
    }
    
    private func prepareFloatingTextFieldDataForAllAnimal(animal: Animal2) -> FloatingTextFieldDataModel {
        .init(firstItem: animal.name ?? "", secondItem: animal.animalType?.rawValue ?? "", thirdItem: animal.id ?? "")
    }
    
    private func prepareFloatingTextFieldDataForGender(gender: GenderType) -> FloatingTextFieldDataModel {
        .init(firstItem: gender.rawValue, secondItem: gender.genderIconForHuman)
    }
    private func prepareFloatingTextFieldDataForAges(age: Int) -> FloatingTextFieldDataModel {
        .init(firstItem: String(age))
    }
    
    private func prepareFloatingTextFieldDataForExperienceYears(year: ExperienceYear) -> FloatingTextFieldDataModel {
        .init(firstItem: year.rawValue, secondItem: year.description)
    }
    
    private func prepareFloatingTextFieldDataForExperienceSalaries(salary: SalaryType) -> FloatingTextFieldDataModel {
        .init(firstItem: salary.rawValue, secondItem: salary.description)
    }
    
    private func notify(_ output: AddEmployeeViewControllerOutput) {
        delegate?.handle(output: output)
    }
}
