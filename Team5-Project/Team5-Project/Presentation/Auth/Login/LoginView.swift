//
//  LoginView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class LoginView: UIView {
    
    // MARK: - UI Components
    
    let navigationBar = {
        let navi = CustomNavigationBar()
        navi.isBackButtonIncluded = true
        return navi
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "로그인해주세요"
        label.textColor = .white
        label.font = .fontGuide(type: .PyeongChangBold, size: 28)
        return label
    }()
    
    let idTextField = CustomTextField(placeHolder: "아이디")
    let pwTextField = CustomTextField(placeHolder: "비밀번호")
    
    let loginButton = {
        let button = UIButton()
        button.backgroundColor = .mainSkyBlue
        button.setTitle("로그인", for: .normal)
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

extension LoginView {
    
    func setUI() {
        backgroundColor = .mainBackground
        pwTextField.isSecureTextEntry = true
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    titleLabel,
                    idTextField,
                    pwTextField,
                    loginButton)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
    }
}
