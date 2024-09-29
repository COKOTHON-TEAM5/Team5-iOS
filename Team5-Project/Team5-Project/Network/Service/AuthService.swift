//
//  AuthService.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

import Moya

final class AuthService {
    
    static let shared: AuthService = AuthService()
    
    private let authProvider = MoyaProvider<AuthTarget>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    public private(set) var loginData: GeneralResponse<SignupResponseDto>?
    public private(set) var signupData: GeneralResponse<SignupResponseDto>?
    public private(set) var checkUserdata: GeneralResponse<CheckUsernameResponseDto>?
    
    // MARK: - GET
    
    func getCheckUsername(name: String,
                          completion: @escaping(GeneralResponse<CheckUsernameResponseDto>?) -> Void) {
        authProvider.request(.getCheckUsername(username: name)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.checkUserdata = try response.map(GeneralResponse<CheckUsernameResponseDto>.self)
                    guard let checkUserdata = self.checkUserdata else { return }
                    completion(checkUserdata)
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // MARK: - POST
    
    func postLogin(requestDto: LoginRequestDto,
                   completion: @escaping(GeneralResponse<SignupResponseDto>?) -> Void) {
        
        authProvider.request(.postLogin(loginRequest: requestDto)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.loginData = try response.map(GeneralResponse<SignupResponseDto>.self)
                    guard let loginData = self.loginData else { return }
                    completion(loginData)
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func postSignup(requestDto: SignupRequestDto,
                    completion: @escaping(GeneralResponse<SignupResponseDto>?) -> Void) {
        
        authProvider.request(.postSignup(signupRequest: requestDto)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.signupData = try response.map(GeneralResponse<SignupResponseDto>.self)
                    guard let signupData = self.signupData else { return }
                    completion(signupData)
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
