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
    
    static let signupURL = "member/signup"
    static let loginURL = "member/login"
    static let checkUsernameURL = "member/check-username"
    
    // Home
    
    static let sleepStartURL = "diary/sleep/start"
    static let sleepEndURL = "diary/sleep/end"
    static let skipURL = "diary/skip"
    static let writeURL = "diary/write"
    static let reportURL = "diary/report"
    
    // Record
    
    static let getRecord = "diary/monthly"
    
}
