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
        label.text = "요즘 \(UserManager.shared.getUserName)는\n행복한 꿈을 많이 꿨구나!"
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
        label.font = .fontGuide(type: .PyeongChangBold, size: 12)
        return label
    }()
    
    let sleepButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitle("꿈 꾸러가기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 12
        return button
    }()
    
    let wakeButton = {
        let button = UIButton()
        button.backgroundColor = .mainSkyBlue
        button.setTitle("꿈 기록하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 12
        button.isHidden = true
        return button
    }()
    
    let completeButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitle("꿈 기록 완성하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 12
        button.isHidden = true
        return button
    }()
    
    let passButton = {
        let button = UIButton()
        button.setTitle("건너뛰기", for: .normal)
        button.titleLabel?.textColor = .gray200
        button.titleLabel?.font = .fontGuide(type: .PyeongChangRegular, size: 12)
        button.setUnderline()
        button.isHidden = true
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    
    func setHierarchy() {
        addSubviews(backgroundImageView, navigationBar, homeTitleLabel, homeDetailView, sleepButton, wakeButton, completeButton, passButton)
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
        
        sleepButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-38)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
        
        wakeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-38)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-38)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
        
        passButton.snp.makeConstraints {
            $0.top.equalTo(completeButton.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(45)
            $0.height.equalTo(25)
        }
    }
    
    func bindHomeView(model: ReportResponseDto) {
        if model.emotion == "" {
            homeTitleLabel.text = "요즘 \(UserManager.shared.getUserName)는\n꿈을 꾸지 않았구나!"
            homeDetailTitle.text = "최근 꿈을 꾸지 않았어"
            homeDetailContent.text = "심리학에서는 꿈이 내면세계를 반영해.\n그러므로 너의 내면적인 성장을 이뤄내기 위해서는\n꿈을 기록하고 파악하는 것이 필요해!"
        } else {
            homeTitleLabel.text = "요즘 \(UserManager.shared.getUserName)는\n\(model.emotion) 꿈을 많이 꿨구나!"
            homeTitleLabel.partColorChange(targetString: "\(model.emotion) 꿈", textColor: .blue100)
            homeDetailTitle.text = "최근 \(model.emotion) 꿈을 총 \(model.maxcount)번 꿨어"
            homeDetailTitle.partColorChange(targetString: "\(model.maxcount)번", textColor: .blue100)
            homeDetailContent.text = model.content
            homeDetailContent.asLineHeight()
            homeDetailIcon.image = Emotion.image(for: "\(model.emotion)")
        }
        switch model.status {
        case 0:
            sleepButton.isHidden = false
            wakeButton.isHidden = true
            completeButton.isHidden = true
            passButton.isHidden = true
        case 1:
            sleepButton.isHidden = true
            wakeButton.isHidden = false
            completeButton.isHidden = true
            passButton.isHidden = true
        case 2:
            sleepButton.isHidden = true
            wakeButton.isHidden = true
            completeButton.isHidden = false
            passButton.isHidden = false
        default:
            break
        }
    }
}
