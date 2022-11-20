//
//  AddAnimalViewController.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import UIKit

class AddAnimalViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: FloatingTextField!
    @IBOutlet private weak var ageTextField: FloatingTextField!
    @IBOutlet private weak var animalTextField: FloatingTextField!
    @IBOutlet private weak var genderTextField: FloatingTextField!
    @IBOutlet private weak var employeeTextField: FloatingTextField!
    
    @IBOutlet private weak var addAnimalButton: UIButton!
    
    var viewModel: AddNewAnimalViewControllerViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.viewDidLoad()
        prepareViews()
    }
    
    private func prepareViews() {
        title = "Add Animal"
        addAnimalButton.layer.cornerRadius = 16
        guard let ages = viewModel?.floatingTextFieldAgeData,
              let animals = viewModel?.floatingtextFieldAnimalData,
              let genders = viewModel?.floatingtextFieldGenderData,
              let employee = viewModel?.floatingTextFieldEmployeeData
        else { return }
        
        animalTextField.delegate = self
        animalTextField.textFieldType = .picker
        animalTextField.dataModel = animals
        animalTextField.setup()
        
        ageTextField.textFieldType = .picker
        ageTextField.dataModel = ages
        ageTextField.setup()
        
        genderTextField.textFieldType = .picker
        genderTextField.dataModel = genders
        genderTextField.setup()
        
        if employee.count != 0 {
            employeeTextField.isHidden = false
            employeeTextField.delegate = self
            employeeTextField.textFieldType = .picker
            employeeTextField.dataModel = employee
            employeeTextField.setup()
        } else {
            employeeTextField.isHidden = true
        }
    }
    
    @IBAction func didTappedAddAnimal(_ sender: Any) {
        
        guard let age = Double(ageTextField.text),
              let waterConsumption = AnimalType(rawValue: animalTextField.text)?.waterConsumption,
              let animalType = AnimalType(rawValue: animalTextField.text)
        else { return }
        
        viewModel?.newAnimal = Animal2(id: UUID().uuidString, name: nameTextField.text, sound: "", age: age, waterConsumption: waterConsumption, animalType: animalType)
        viewModel?.addNewAnimal()
    }
}

extension AddAnimalViewController: AddNewAnimalViewControllerDelegate {
    func handle(output: AddNewAnimalViewControllerOutput) {
        switch output {
        case .didAddNewAnimal:
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension AddAnimalViewController: FloatingTextFieldDelegate {
    func didChangeTextField(_ thirdItem: String?) {
        let animalName = animalTextField.text
        let animalIcon = AnimalType(rawValue: animalName)?.animalIcon ?? ""
        title = "Add Animal \(animalName) \(animalIcon)"
        addAnimalButton.setTitle("Add Animal \(animalName) \(animalIcon)", for: .normal)
        guard let thirdItem = thirdItem
        else { return }
        viewModel?.searchEmployeeForNewAnimal(with: thirdItem)
    }
}
