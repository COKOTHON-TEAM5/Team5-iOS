//
//  SignupView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class SignupView: UIView {
    
    // MARK: - UI Components
    
    let navigationBar = {
        let navi = CustomNavigationBar()
        navi.isBackButtonIncluded = true
        return navi
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "회원가입 해주세요"
        label.textColor = .white
        label.font = .fontGuide(type: .PyeongChangBold, size: 28)
        return label
    }()
    
    let idTextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.textColor = .black
        textField.backgroundColor = .gray100
        textField.font = .fontGuide(type: .PretandardRegular, size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [
            .foregroundColor: UIColor.gray500,
            .font: UIFont.fontGuide(type: .PretandardRegular, size: 16)
        ])
        textField.layer.cornerRadius =  12
        textField.setLeftPadding(amount: 12)
        return textField
    }()
    
    let checkButton = {
        let button = UIButton()
        button.backgroundColor = .mainSkyBlue
        button.setTitle("중복확인", for: .normal)
        button.setTitle("확인완료", for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 16)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let pwTextField = CustomTextField(placeHolder: "비밀번호")
    let nicknameTextField = CustomTextField(placeHolder: "닉네임")
    
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

extension SignupView {
    
    func setUI() {
        backgroundColor = .mainBackground
    }
    
    func setHierarchy() {
        addSubviews(navigationBar,
                    titleLabel,
                    idTextField,
                    checkButton,
                    pwTextField,
                    nicknameTextField,
                    signupButton)
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
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 137)
            $0.height.equalTo(48)
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.top)
            $0.leading.equalTo(idTextField.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
    }
}

