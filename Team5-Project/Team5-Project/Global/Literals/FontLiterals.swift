//
//  FontLiterals.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

enum FontType: String {
    case PretandardBold = "Pretendard-Bold"
    case PretandardRegular = "Pretendard-Regular"
    case PretandardSemiBold = "Pretendard-SemiBold"
    
    case PyeongChangBold = "PyeongChang-Bold"
    case PyeongChangRegular = "PyeongChang-Regular"
}

extension UIFont {
    
    static func fontGuide(type: FontType, size: CGFloat) -> UIFont {
        let baseFont = UIFont(name: type.rawValue, size: size)!
        return baseFont
    }
}
