//
//  SeeAllEmployeeAndAnimalCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 20.11.2022.
//

import UIKit

class SeeAllEmployeeAndAnimalCell: UITableViewCell {

    var employees: [Employee2] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTappedSeeAllEmployeeAndAnimalButton(_ sender: Any) {
        let nibName = String(describing: EmployeeAnimalListViewController.self)
        let vc = EmployeeAnimalListViewController(nibName: nibName, bundle: .main)
        vc.employee = employees
        UIApplication.getTopViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
