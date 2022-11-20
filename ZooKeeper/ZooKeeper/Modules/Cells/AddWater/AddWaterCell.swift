//
//  AddWaterCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 19.11.2022.
//

import UIKit

protocol AddWaterCellDelegate: AnyObject {
    func didTappedAddWather(_ lt: Double)
}

class AddWaterCell: UITableViewCell {
    
    weak var delegate: AddWaterCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addWaterButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Water", message: "This zoo has a minimum water capacity of 5,000 liters and a maximum of 15,000 liters of water. \n 1₺/lt.", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        let addButton = UIAlertAction(title: "Add", style: .default) { _ in
            if let textField = alertController.textFields?.first,
               let lt = Double(textField.text ?? "") {
                if lt < 5000 {
                    let alertController = UIAlertController(title: "Ooppss!!", message: "You should buy a minimum of 5000 liters.", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Ok", style: .default)
                    alertController.addAction(okButton)
                    UIApplication.getTopViewController()?.present(alertController, animated: true)
                } else if lt > 15000 {
                    let alertController = UIAlertController(title: "Ooppss!!", message: "You should buy a maximum of 15000 liters.", preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "Ok", style: .default)
                    alertController.addAction(okButton)
                    UIApplication.getTopViewController()?.present(alertController, animated: true)
                } else {
                    self.delegate?.didTappedAddWather(lt)
                }
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(cancelButton)
        alertController.addAction(addButton)
        UIApplication.getTopViewController()?.present(alertController, animated: true)
    }
}
