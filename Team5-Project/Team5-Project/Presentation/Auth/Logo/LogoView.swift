//
//  LogoView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class LogoView: UIView {
    
    private let logoImageView = UIImageView(image: .logo)
    
    private let logoTitle = {
        let label = UILabel()
        label.text = "꿈으로 기록하는 나의 성장 일기"
        label.textColor = .gray200
        label.font = .fontGuide(type: .PyeongChangBold, size: 13)
        return label
    }()
    
    let loginButton = {
        let button = UIButton()
        button.backgroundColor = .mainSkyBlue
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let signupButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 20
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

extension LogoView {
    
    func setUI() {
        backgroundColor = .mainBackground
    }
    
    func setHierarchy() {
        addSubviews(logoImageView, logoTitle, signupButton, loginButton)
    }
    
    func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(180)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(157)
            $0.height.equalTo(173)
        }
        
        logoTitle.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        signupButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
        
        loginButton.snp.makeConstraints {
            $0.bottom.equalTo(signupButton.snp.top).offset(-15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
    }
}
