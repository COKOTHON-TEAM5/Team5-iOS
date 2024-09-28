//
//  SizeLiterals.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

struct SizeLiterals {
    struct Screen {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let deviceRatio: CGFloat = screenWidth / screenHeight
    }
}

extension SizeLiterals {
    static func applyDeviceWidth(_ width: CGFloat) -> CGFloat {
        return SizeLiterals.Screen.screenWidth * width / 375
    }
    
    static func applyDeviceHeight(_ height: CGFloat) -> CGFloat {
        return SizeLiterals.Screen.screenHeight * height / 812
    }
}

