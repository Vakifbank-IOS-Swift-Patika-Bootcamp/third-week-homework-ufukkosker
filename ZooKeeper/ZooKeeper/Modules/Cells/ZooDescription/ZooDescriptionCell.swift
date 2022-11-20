//
//  ZooDescriptionCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 20.11.2022.
//

import UIKit

class ZooDescriptionCell: UITableViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func config() {
        descriptionLabel.text = """
Hello and welcome to the ZooKeeper app. To start building a zoo, you must first have a budget.\nPress the "Add Budget 💰" button to get a budget. Once you have the budget, you must add water to your zoo. There is no life without water. Press the "Add Water 💧" button to get water.\n-⚠️Warning⚠️-\n1- The zoo you are trying to develop needs a minimum of 5,000 liters of water and the liter price is calculated as ₺1.\n2- The zoo you are trying to develop must have a minimum budget of ₺10,000.
"""
    }
}
