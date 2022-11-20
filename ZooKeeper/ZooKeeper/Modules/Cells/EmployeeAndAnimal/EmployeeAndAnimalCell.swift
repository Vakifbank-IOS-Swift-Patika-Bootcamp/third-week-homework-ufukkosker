//
//  EmployeeAndAnimalCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import UIKit

class EmployeeAndAnimalCell: UITableViewCell {

    @IBOutlet private weak var imageLabel: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var waterConsumptionStackView: UIStackView!
    @IBOutlet private weak var slaryStackView: UIStackView!
    @IBOutlet private weak var salaryLabel: UILabel!
    @IBOutlet private weak var waterConsumptionLabel: UILabel!
    @IBOutlet private weak var employeeOrAnimalCollectionView: UICollectionView!
    
    private var employee: Employee2 = Employee2()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        employeeOrAnimalCollectionView.dataSource = self
        registerCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageLabel.image = employee.gender?.genderIconForHuman.textToImage()
        nameLabel.text = employee.name
        salaryLabel.text = "\(employee.salary ?? 0.0)"
        waterConsumptionStackView.isHidden = true
        // Configure the view for the selected state
    }
    
    private func registerCell() {
        let nibName = String(describing: AnimalListCell.self)
        let nib = UINib(nibName: nibName, bundle: .main)
        employeeOrAnimalCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: AnimalListCell.self))
    }
    
    func config(with model: Employee2) {
        employee = model
    }
}

extension EmployeeAndAnimalCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employee.animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AnimalListCell.self), for: indexPath) as? AnimalListCell {
            cell.config(with: employee.animals[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
