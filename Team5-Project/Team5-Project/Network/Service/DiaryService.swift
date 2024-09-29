//
//  DiaryService.swift
//  Team5-Project
//
//  Created by 고아라 on 9/29/24.
//

import Foundation

import Moya

final class DiaryService {
    
    static let shared: DiaryService = DiaryService()
    
    private let diaryProvider = MoyaProvider<DiaryTarget>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    public private(set) var sleepStartData: GeneralResponse<EmptyDto>?
    public private(set) var sleepEndData: GeneralResponse<EmptyDto>?
    public private(set) var sleepSkipData: GeneralResponse<EmptyDto>?
    public private(set) var writeData: GeneralResponse<EmptyDto>?
    public private(set) var homeData: GeneralResponse<ReportResponseDto>?
    
    // MARK: - GET
    
    func getReport(completion: @escaping(GeneralResponse<ReportResponseDto>?) -> Void) {
        diaryProvider.request(.getReport) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.homeData = try response.map(GeneralResponse<ReportResponseDto>.self)
                    guard let homeData = self.homeData else { return }
                    completion(homeData)
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
    
    func postSleepStart(requestDto: SleepStartRequestDto,
                        completion: @escaping(GeneralResponse<EmptyDto>?) -> Void) {
        
        diaryProvider.request(.postSleepStart(sleepRequest: requestDto)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.sleepStartData = try response.map(GeneralResponse<EmptyDto>.self)
                    guard let sleepStartData = self.sleepStartData else { return }
                    completion(sleepStartData)
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func postSleepEnd(requestDto: SleepStartRequestDto,
                      completion: @escaping(GeneralResponse<EmptyDto>?) -> Void) {
        
        diaryProvider.request(.postSleepEnd(sleepRequest: requestDto)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.sleepEndData = try response.map(GeneralResponse<EmptyDto>.self)
                    guard let sleepEndData = self.sleepEndData else { return }
                    completion(sleepEndData)
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func postSkip(completion: @escaping(GeneralResponse<EmptyDto>?) -> Void) {
        diaryProvider.request(.postSkip) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.sleepSkipData = try response.map(GeneralResponse<EmptyDto>.self)
                    guard let sleepSkipData = self.sleepSkipData else { return }
                    completion(sleepSkipData)
                } catch let err {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func postWrite(requestDto: WriteRequstDto,
                   completion: @escaping(GeneralResponse<EmptyDto>?) -> Void) {
        diaryProvider.request(.postWrite(writeRequest: requestDto)) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    self.writeData = try response.map(GeneralResponse<EmptyDto>.self)
                    guard let writeData = self.writeData else { return }
                    completion(writeData)
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
