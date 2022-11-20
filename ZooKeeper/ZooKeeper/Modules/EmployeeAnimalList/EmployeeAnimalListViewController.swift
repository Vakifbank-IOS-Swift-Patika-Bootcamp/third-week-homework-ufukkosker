//
//  EmployeeAnimalListViewController.swift
//  ZooKeeper
//
//  Created by Ufuk on 20.11.2022.
//

import UIKit

class EmployeeAnimalListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var employee: [Employee2] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let employeeAndAnimalCellName = String(describing: EmployeeAndAnimalCell.self)
        let employeeAndAnimalNib = UINib(nibName: employeeAndAnimalCellName, bundle: .main)
        tableView.register(employeeAndAnimalNib, forCellReuseIdentifier: String(describing: EmployeeAndAnimalCell.self))
    }
}

extension EmployeeAnimalListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EmployeeAndAnimalCell.self), for: indexPath) as? EmployeeAndAnimalCell {
            cell.config(with: employee[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
