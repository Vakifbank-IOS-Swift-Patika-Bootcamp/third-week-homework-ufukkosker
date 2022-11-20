//
//  AddEmployeeViewController.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    @IBOutlet private weak var nameTextField: FloatingTextField!
    @IBOutlet private weak var surNameTextField: FloatingTextField!
    @IBOutlet private weak var genderTextField: FloatingTextField!
    @IBOutlet private weak var ageTextField: FloatingTextField!
    @IBOutlet private weak var experienceTextField: FloatingTextField!
    @IBOutlet private weak var salaryTextField: FloatingTextField!
    @IBOutlet private weak var animalTextField: FloatingTextField!
    @IBOutlet private weak var addEmployeeButton: UIButton!
    
    var viewModel: AddEmployeeViewControllerViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Employee 🙎🏻‍♂️"
        viewModel?.viewDidLoad()
        prepareViews()
    }
    
    private func prepareViews() {
        addEmployeeButton.layer.cornerRadius = 16
        guard let animalsData = viewModel?.floatingTextFieldAnimalData,
              let genders = viewModel?.floatingTextFieldGenderData,
              let ages = viewModel?.floatingTextFieldAgeData,
              let experienceYears = viewModel?.floatingTextFieldExperienceData,
              let salaries = viewModel?.floatingTextFieldSalaryData
        else { return }
        if animalsData.count != 0 {
            animalTextField.isHidden = false
            animalTextField.delegate = self
            animalTextField.textFieldType = .picker
            animalTextField.dataModel = animalsData
            animalTextField.setup()
        } else {
            animalTextField.isHidden = true
        }
        genderTextField.delegate = self
        genderTextField.textFieldType = .picker
        genderTextField.dataModel = genders
        genderTextField.setup()
        
        ageTextField.textFieldType = .picker
        ageTextField.dataModel = ages
        ageTextField.setup()
        
        experienceTextField.delegate = self
        experienceTextField.textFieldType = .picker
        experienceTextField.dataModel = experienceYears
        experienceTextField.setup()
        
        salaryTextField.delegate = self
        salaryTextField.textFieldType = .picker
        salaryTextField.dataModel = salaries
        salaryTextField.setup()
        calculateSalaryAndChaneTitle()
    }
    
    private func calculateSalaryAndChaneTitle() {
        title = "Add Employee \(String(describing: GenderType(rawValue: genderTextField.text)?.genderIconForHuman ?? ""))"
        guard let calculatedSalary = viewModel?.calculateSalary(selectedSalary: salaryTextField.text, selectedExperience: experienceTextField.text)
        else { return }
        addEmployeeButton.setTitle("Add Employee ₺\(calculatedSalary)", for: .normal)
    }
    
    @IBAction func didTappedAddEmployee(_ sender: UIButton) {
        guard let age = Int(ageTextField.text),
              let genderType = GenderType(rawValue: genderTextField.text),
              let calculatedSalary = viewModel?.calculateSalary(selectedSalary: salaryTextField.text, selectedExperience: experienceTextField.text),
              let experienceYear = ExperienceYear(rawValue: experienceTextField.text)
        else { return }
        let newEmployee = Employee2(id: UUID().uuidString, name: nameTextField.text, lastName: surNameTextField.text, age: age, gender: genderType, salary: calculatedSalary, experienceYear: experienceYear)
        viewModel?.newEmployee = newEmployee
        viewModel?.addNewEmployee()
    }
}

extension AddEmployeeViewController: AddEmployeeViewControllerDelegate {
    func handle(output: AddEmployeeViewControllerOutput) {
        switch output {
        case .didAddNewEmployee:
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension AddEmployeeViewController: FloatingTextFieldDelegate {
    func didChangeTextField(_ thirdItem: String?) {
        calculateSalaryAndChaneTitle()
        guard let animalId = thirdItem
        else { return }
        viewModel?.searchAnimalForNewEmployee(with: animalId)
    }
}
