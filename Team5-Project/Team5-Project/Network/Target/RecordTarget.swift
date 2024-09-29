//
//  RecordTarget.swift
//  Team5-Project
//
//  Created by KJ on 9/29/24.
//

import Foundation

import Moya

enum RecordTarget {
    case getRecord(year: Int, month: Int)
}

extension RecordTarget: BaseTargetType {
    var path: String {
        switch self {
        case .getRecord:
            return URLConstant.getRecord
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getRecord(let year, let month):
            return .requestParameters(
                parameters: [
                    "year": year,
                    "month": month
                ],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return HeaderConstant.hasTokenHeader
    }
}
