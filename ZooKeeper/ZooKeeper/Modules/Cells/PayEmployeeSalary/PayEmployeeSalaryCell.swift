//
//  PayEmployeeSalaryCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 20.11.2022.
//

import UIKit

protocol PayEmployeeSalaryCellDelegate: AnyObject {
    func didTappedPaySalaryButton()
}

class PayEmployeeSalaryCell: UITableViewCell {

    weak var delegate: PayEmployeeSalaryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func payEmployeeSalaryButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Pay Emplyees Salary", message: "You will pay the salaries of the employees.", preferredStyle: .alert)
        let payButton = UIAlertAction(title: "Pay", style: .default) { _ in
            self.delegate?.didTappedPaySalaryButton()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        alertController.addAction(cancelButton)
        alertController.addAction(payButton)
        UIApplication.getTopViewController()?.present(alertController, animated: true)
    }
}
