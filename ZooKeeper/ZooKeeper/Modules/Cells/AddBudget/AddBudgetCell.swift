//
//  AddBudgetCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 19.11.2022.
//

import UIKit

protocol AddBudgetCellDelegate: AnyObject {
    func didTappedAddBudget(price: Double)
}

class AddBudgetCell: UITableViewCell {
    
    weak var delegate: AddBudgetCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addBudgetButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Budget", message: "You can have a minimum budget of ₺10,000, a maximum of ₺100,000.", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        let addButton = UIAlertAction(title: "Add", style: .default) { _ in
            if let textField = alertController.textFields?.first,
               let price = Double(textField.text ?? "") {
                if price < 10000 {
                    let alertController = UIAlertController(title: "Ooppss!!", message: "You can get a minimum of ₺10,000.", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Ok", style: .default)
                    alertController.addAction(okButton)
                    UIApplication.getTopViewController()?.present(alertController, animated: true)
                } else if price > 100000 {
                    let alertController = UIAlertController(title: "Ooppss!!", message: "You can get a minimum of ₺100,000.", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Ok", style: .default)
                    alertController.addAction(okButton)
                    UIApplication.getTopViewController()?.present(alertController, animated: true)
                } else {
                    self.delegate?.didTappedAddBudget(price: price)
                }
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(cancelButton)
        alertController.addAction(addButton)
        UIApplication.getTopViewController()?.present(alertController, animated: true)
    }
}
