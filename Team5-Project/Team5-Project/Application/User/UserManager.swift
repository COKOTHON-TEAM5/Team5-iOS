//
//  UserManager.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

final class UserManager {
    
    static let shared = UserManager()
    
    @UserDefaultWrapper<String>(key: "accessToken") private(set) var accessToken
    @UserDefaultWrapper<String>(key: "userName") private(set) var userName
    
    var hasAccessToken: Bool { return self.accessToken != nil }
    var getAccessToken: String { return self.accessToken ?? "" }
    var getUserName: String { return self.userName ?? "" }
    
    private init() {}
}

extension UserManager {
    
    func updateUserName(_ userName: String) {
        self.userName = userName
    }
    
    func updateToken(_ accessToken: String) {
        self.accessToken = accessToken
    }
    
    func logout() {
        self.accessToken = nil
    }
    
    func withdraw() {
        self.accessToken = nil
    }
}
