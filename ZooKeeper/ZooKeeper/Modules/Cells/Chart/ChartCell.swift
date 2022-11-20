//
//  ChartCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import UIKit

class ChartCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var progressContainerView: UIView!
    @IBOutlet private weak var progressValueView: UIView!
    @IBOutlet private weak var progressViewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with model: ZooInfo) {
        titleLabel.text = model.title
        valueLabel.text = "\(model.totalValue)/\(model.currentValue)"
        iconImageView.image = model.icon
        iconImageView.tintColor = .label
        progressValueView.backgroundColor = model.color
        let doubleValue = Double(model.currentValue)
        let maxValueDouble = Double(model.totalValue)
        let ratio = maxValueDouble / doubleValue
        let percent = progressContainerView.frame.width / CGFloat(ratio)
        self.progressViewWidthConstraint.constant = CGFloat(percent)
    }
}
