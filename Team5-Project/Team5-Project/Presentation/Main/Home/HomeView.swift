//
//  HomeView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class HomeView: UIView {
    
    private let backgroundImageView = UIImageView(image: .backgroundHome)
    
    private let navigationBar = {
        let navi = CustomNavigationBar()
        navi.isTitleViewIncluded = true
        navi.isTitleLabelIncluded = "홈"
        return navi
    }()
    
    private let homeTitleLabel = {
        let label = UILabel()
        label.text = "요즘 아라는\n행복한 꿈을 많이 꿨구나!"
        label.textColor = .white
        label.textAlignment = .left
        label.partColorChange(targetString: "행복한 꿈", textColor: .blue100)
        label.font = .fontGuide(type: .PretandardBold, size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private let homeDetailView = {
        let view = UIView()
        view.backgroundColor = .blue800
        view.layer.borderColor = UIColor.blue100.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let homeDetailIcon = UIImageView(image: .imgIcon)
    
    private let homeDetailTitle = {
        let label = UILabel()
        label.text = "최근 행복한 꿈을 총 12번 꿨어"
        label.textColor = .white
        label.partColorChange(targetString: "12번", textColor: .blue100)
        label.font = .fontGuide(type: .PyeongChangBold, size: 16)
        return label
    }()
    
    private let homeDetailContent = {
        let label = UILabel()
        label.text = "내용\n내용내용내용내용\n내내내내용요요요요용"
        label.asLineHeight()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.font = .fontGuide(type: .PyeongChangRegular, size: 12)
        return label
    }()
    
    private let homeButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitle("꿈 꾸러가기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 12
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    
    func setUI() {
        
    }
    
    func setHierarchy() {
        addSubviews(backgroundImageView, navigationBar, homeTitleLabel, homeDetailView, homeButton)
        homeDetailView.addSubviews(homeDetailIcon, homeDetailTitle, homeDetailContent)
    }
    
    func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        homeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(90)
            $0.leading.equalToSuperview().inset(23)
        }
        
        homeDetailView.snp.makeConstraints {
            $0.top.equalTo(homeTitleLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(174)
        }
        
        homeDetailIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(12)
            $0.size.equalTo(59)
        }
        
        homeDetailTitle.snp.makeConstraints {
            $0.leading.equalTo(homeDetailIcon.snp.trailing).offset(16)
            $0.centerY.equalTo(homeDetailIcon)
        }
        
        homeDetailContent.snp.makeConstraints {
            $0.top.equalTo(homeDetailIcon.snp.bottom).offset(5)
            $0.leading.equalTo(homeDetailIcon.snp.leading).offset(6)
        }
        
        homeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
    }
}
