//
//  ZooInfo.swift
//  ZooKeeper
//
//  Created by Ufuk on 19.11.2022.
//

import Foundation
import UIKit

class ZooInfo {
    var title: String
    var totalValue: Double
    var currentValue: Double
    var icon: UIImage
    var color: UIColor
    
    init(title: String = "", totalValue: Double = 0.0, currentValue: Double = 0.0, icon: UIImage = UIImage(), color: UIColor = .clear) {
        self.title = title
        self.totalValue = totalValue
        self.currentValue = currentValue
        self.icon = icon
        self.color = color
    }
}
