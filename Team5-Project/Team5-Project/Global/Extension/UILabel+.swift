//
//  UILabel+.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

extension UILabel {
    
    func partColorChange(targetString: String, textColor: UIColor) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedString
    }
}
