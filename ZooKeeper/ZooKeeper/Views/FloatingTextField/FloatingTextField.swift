//
//  FloatingTextField.swift
//  ZooKeeper
//
//  Created by Ufuk on 16.11.2022.
//

import UIKit

protocol FloatingTextFieldDelegate {
    func didChangeTextField(_ thirdItem: String?)
}

class FloatingTextField: NibLoadableView {
    
    @IBOutlet private weak var floatingTextField: UITextField!
    @IBOutlet private weak var floatingPlaceholder: UILabel!
    @IBOutlet private weak var placeholderYConstraint: NSLayoutConstraint!
    @IBOutlet private weak var floatingImageView: UIImageView!
    
    var textFieldType = TextFieldType.normal
    var dataModel: [FloatingTextFieldDataModel] = []
    
    var text: String {
        floatingTextField.text ?? ""
    }
    
    var pickerView: UIPickerView = {
       let picker = UIPickerView()
        return picker
    }()
    
    var toolBar: UIToolbar = {
        let toolBar = UIToolbar()

        return toolBar
    }()
    
    @IBInspectable
    var placeholder: String = "" {
        didSet {
            self.floatingPlaceholder.text = placeholder
        }
    }
    
    @IBInspectable
    var isPassword: Bool = false {
        didSet {
            self.floatingTextField.isSecureTextEntry = isPassword
        }
    }
    
    let doneButton = UIBarButtonItem(title: "Seç", style: UIBarButtonItem.Style.done, target: nil, action: #selector(donePicker))
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    var delegate: FloatingTextFieldDelegate?
    override func setup() {
        floatingPlaceholder.font = self.floatingPlaceholder.font.withSize(14)
        floatingTextField.layer.borderWidth = 2
        floatingTextField.layer.borderColor = UIColor.systemGray4.cgColor
        floatingTextField.layer.cornerRadius = 12
        floatingTextField.autocapitalizationType = .words
        floatingTextField.delegate = self
        pickerView.delegate = self
        setupTextFieldType()
    }
    
    func setupTextFieldType() {
        switch textFieldType {
        case .normal:
            floatingImageView.isHidden = true
        case .picker:
            floatingImageView.isHidden = false
            toolBar.sizeToFit()
            toolBar.setItems([spaceButton, doneButton], animated: true)
            toolBar.isUserInteractionEnabled = true
            floatingTextField.inputView = pickerView
            floatingTextField.inputAccessoryView = toolBar
            pickerView.reloadAllComponents()
        }
    }
    
    @objc func donePicker() {
        if text == "" {
            floatingTextField.text = dataModel.first?.firstItem ?? ""
            delegate?.didChangeTextField(dataModel[2].thirdItem)
        }
        floatingTextField.resignFirstResponder()
    }
}

enum TextFieldType {
    case normal
    case picker
}

extension FloatingTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataModel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let stackView = UIStackView()
        let itemLabel = UILabel()
        let subItemLabel = UILabel()
        let idLabel = UILabel()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        itemLabel.text = dataModel[row].firstItem ?? ""
        subItemLabel.text = dataModel[row].secondItem ?? ""
        
        stackView.addArrangedSubview(itemLabel)
        stackView.addArrangedSubview(subItemLabel)
        
        return stackView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = dataModel[row].firstItem ?? ""
        floatingTextField.text = selectedRow
        delegate?.didChangeTextField(dataModel[row].thirdItem)
    }
}

extension FloatingTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.transition(with: floatingPlaceholder, duration: 0.2, options: .transitionCrossDissolve) {
            self.floatingTextField.layer.borderColor = UIColor.systemBlue.cgColor
            self.floatingPlaceholder.textColor = .systemBlue
            self.floatingPlaceholder.font = self.floatingPlaceholder.font.withSize(12)
            self.placeholderYConstraint.constant = -14
            self.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textFieldType {
        case .normal:
            break
//            floatingTextField.text = floatingTextField.text?.applyPatternOnNumbers(pattern: "(###) ### ## ##", replacementCharacter: "#")
        case .picker:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.transition(with: floatingPlaceholder, duration: 0.2, options: .transitionCrossDissolve) {
            self.floatingTextField.layer.borderColor = UIColor.systemGray4.cgColor
            self.floatingPlaceholder.textColor = .gray//UIColor(named: "GrayDarker")
            self.floatingPlaceholder.font = self.floatingPlaceholder.font.withSize(self.floatingTextField.text == "" ? 14 : 12)
            self.placeholderYConstraint.constant = self.floatingTextField.text == "" ? 0 : -14
            self.layoutIfNeeded()
        }
    }
}
