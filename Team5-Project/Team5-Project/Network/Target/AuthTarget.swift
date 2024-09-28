//
//  AuthTarget.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

import Moya

enum AuthTarget {
    
    case postSignup(signupRequest: SignupRequestDto)
    case postLogin(loginRequest: LoginRequestDto)
    case getCheckUsername(username: String)
}

extension AuthTarget: BaseTargetType {
    
    var path: String {
        switch self{
        case .postSignup:
            return URLConstant.signupURL
        case .postLogin:
            return URLConstant.loginURL
        case .getCheckUsername:
            return URLConstant.checkUsernameURL
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .postSignup, .postLogin:
            return .post
        case .getCheckUsername:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .postSignup(let signupRequest):
            return .requestJSONEncodable(signupRequest)
        case .postLogin(let loginRequest):
            return .requestJSONEncodable(loginRequest)
        case .getCheckUsername(let username):
            return .requestParameters(parameters: ["username": username], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return HeaderConstant.noTokenHeader
    }
}
