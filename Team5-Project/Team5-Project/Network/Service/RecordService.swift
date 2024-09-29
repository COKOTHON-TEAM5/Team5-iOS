//
//  RecordService.swift
//  Team5-Project
//
//  Created by KJ on 9/29/24.
//

import Foundation

import Moya

final class RecordService {
    
    static let shared: RecordService = RecordService()
    
    private let recordProvider = MoyaProvider<RecordTarget>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    public private(set) var recordData: GeneralResponse<RecordResponseDto>?
    
    // MARK: - GET
    
    func getRecord(year: Int, month: Int, completion: @escaping (GeneralResponse<RecordResponseDto>?) -> Void) {
        recordProvider.request(.getRecord(year: year, month: month)) { result in
            switch result {
            case .success(let response):
                do {
                    self.recordData = try response.map(GeneralResponse<RecordResponseDto>?.self)
                    guard let recordData = self.recordData else { return }
                    completion(recordData)
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
