//
//  FloatingTextFieldDataModel.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import Foundation

final class FloatingTextFieldDataModel: FloatingTextFieldDataProtocol {
    
    var firstItem: String?
    var secondItem: String?
    var thirdItem: String
    
    init(firstItem: String, secondItem: String = "", thirdItem: String = "") {
        self.firstItem = firstItem
        self.secondItem = secondItem
        self.thirdItem = thirdItem
    }
}
