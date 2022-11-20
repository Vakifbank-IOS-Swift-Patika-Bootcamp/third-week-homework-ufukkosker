//
//  AnimalListCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 20.11.2022.
//

import UIKit

class AnimalListCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var animalTypeLabel: UILabel!
    @IBOutlet private weak var animalIcon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(with model: Animal2) {
        nameLabel.text = model.name
        animalTypeLabel.text = model.animalType?.rawValue
        animalIcon.text = model.animalType?.animalIcon
    }
}
