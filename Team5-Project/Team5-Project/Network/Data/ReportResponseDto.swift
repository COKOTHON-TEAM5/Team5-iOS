//
//  ReportResponseDto.swift
//  Team5-Project
//
//  Created by 고아라 on 9/29/24.
//

import Foundation

struct ReportResponseDto: Codable {
    let maxcount: Int
    let emotion, content: String
    let status: Int
    let sleepTime: Int
}
