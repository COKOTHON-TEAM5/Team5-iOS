//
//  UITextField+.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
