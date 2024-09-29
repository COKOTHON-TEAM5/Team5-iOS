//
//  RecordResponseDto.swift
//  Team5-Project
//
//  Created by KJ on 9/29/24.
//

import Foundation

// MARK: - DataClass
struct RecordResponseDto: Codable {
    let diaries: [Diary]
}

// MARK: - Diary
struct Diary: Codable {
    let id: Int
    let date: String
    let sleepTime: Int
    let emotion, title, content: String
}
