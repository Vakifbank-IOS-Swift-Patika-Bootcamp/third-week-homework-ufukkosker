//
//  FloatingTextFieldConfig.swift
//  ZooKeeper
//
//  Created by Ufuk on 16.11.2022.
//

import UIKit

class FloatingTextFieldConfig: UITextField {

    let padding = UIEdgeInsets(top: 14, left: 20, bottom: 0, right: 20)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
