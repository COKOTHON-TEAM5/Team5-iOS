//
//  BaseTargetType.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
}
