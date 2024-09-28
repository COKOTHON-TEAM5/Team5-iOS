//
//  NSObject+.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
