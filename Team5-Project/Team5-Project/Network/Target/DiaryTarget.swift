//
//  DiaryTarget.swift
//  Team5-Project
//
//  Created by 고아라 on 9/29/24.
//

import Foundation

import Moya

enum DiaryTarget {
    
    case postSleepStart(sleepRequest: SleepStartRequestDto)
    case postSleepEnd(sleepRequest: SleepStartRequestDto)
    case postSkip
    case postWrite(writeRequest: WriteRequstDto)
    case getReport
}

extension DiaryTarget: BaseTargetType {
    
    var path: String {
        switch self{
        case .postSleepStart:
            return URLConstant.sleepStartURL
        case .postSleepEnd:
            return URLConstant.sleepEndURL
        case .postSkip:
            return URLConstant.skipURL
        case .postWrite:
            return URLConstant.writeURL
        case .getReport:
            return URLConstant.reportURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getReport:
            return .get
        default:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .postSleepStart(let sleepRequest):
            return .requestJSONEncodable(sleepRequest)
        case .postSleepEnd(let sleepRequest):
            return .requestJSONEncodable(sleepRequest)
        case .postSkip:
            return .requestPlain
        case .postWrite(let writeRequest):
            return .requestJSONEncodable(writeRequest)
        case .getReport:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return HeaderConstant.hasTokenHeader
    }
}
