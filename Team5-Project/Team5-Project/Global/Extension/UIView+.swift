//
//  UIView+.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
