//
//  URLConstant.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

enum URLConstant {
    
    // MARK: - Base URL
    
    static let baseURL = Config.baseURL
    
    // Auth
    
    static let signupURL = baseURL + "member/signup"
    static let loginURL = baseURL + "member/login"
    static let checkUsernameURL = baseURL + "member/check-username"
    
    // Home
    
    static let sleepStartURL = baseURL + "diary/sleep/start"
    static let sleepEndURL = baseURL + "diary/sleep/end"
    static let skipURL = baseURL + "diary/skip"
    
    // Record
    
}
