//
//  MypageMenuModel.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import Foundation

struct MypageMenuModel {
    let title: String
}

extension MypageMenuModel {
    static func mypageMenu() -> [MypageMenuModel] {
        return [
            MypageMenuModel(title: "공지사항"),
            MypageMenuModel(title: "약관 및 정책"),
            MypageMenuModel(title: "개발자 소개"),
            MypageMenuModel(title: "로그아웃"),
            MypageMenuModel(title: "탈퇴하기")
        ]
    }
}
