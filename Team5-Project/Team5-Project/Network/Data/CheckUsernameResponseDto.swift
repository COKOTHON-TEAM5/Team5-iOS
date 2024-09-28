//
//  CheckUsernameResponseDto.swift
//  Team5-Project
//
//  Created by 고아라 on 9/29/24.
//

import Foundation

struct CheckUsernameResponseDto: Codable {
    let code: Int
    let message: String
    let data: Bool
}
