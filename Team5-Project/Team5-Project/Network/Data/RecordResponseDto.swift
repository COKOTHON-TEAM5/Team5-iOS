//
//  RecordResponseDto.swift
//  Team5-Project
//
//  Created by KJ on 9/29/24.
//

import Foundation

struct RecordResponseDto: Codable {
    let id: Int
    let date: String
    let sleepTime: Int
    let emotion: String
    let title: String
    let content: String
}
