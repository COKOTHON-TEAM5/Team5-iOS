//
//  HomeView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class HomeView: UIView {
    
    private let navigationBar = {
        let navi = CustomNavigationBar()
        navi.isTitleViewIncluded = true
        navi.isTitleLabelIncluded = "홈"
        return navi
    }()
}
