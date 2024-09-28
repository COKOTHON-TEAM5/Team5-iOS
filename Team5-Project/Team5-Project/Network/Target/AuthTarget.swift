//
//  AuthTarget.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

import Moya
//
//enum AuthTarget {
//    
//    case postLogin(loginRequest: LoginRequestDto)
//    case delWithdraw
//    case patchLogout
//    case getReissue
//}
//
//extension AuthTarget: BaseTargetType {
//    
//    var path: String {
//        switch self{
//        case .getReissue:
//            return URLConstant.authToken
//        default:
//            return URLConstant.auth
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self{
//        case .postLogin:
//            return .post
//        case .delWithdraw:
//            return .delete
//        case .patchLogout:
//            return .patch
//        case .getReissue:
//            return .get
//        }
//    }
//    
//    var task: Moya.Task {
//        switch self{
//        case .postLogin(let loginRequest):
//            return .requestJSONEncodable(loginRequest)
//        default:
//            return .requestPlain
//        }
//    }
//    
//    var headers: [String : String]? {
//        switch self{
//        case .postLogin:
//            return HeaderConstant.hasSocialTokenHeader
//        case .getReissue:
//            return HeaderConstant.hasRefreshTokenHeader
//        default:
//            return HeaderConstant.hasTokenHeader
//        }
//    }
//}
