//
//  LoginViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
        setDelegate()
        setGesture()
    }
}

extension LoginViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    func setDelegate() {
        loginView.navigationBar.delegate = self
        loginView.idTextField.delegate = self
        loginView.pwTextField.delegate = self
    }
    
    @objc
    func loginTapped() {
        self.postLogin(dto: LoginRequestDto(username: loginView.idTextField.text ?? "", password: loginView.pwTextField.text ?? ""))
    }
    
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func changeRootToTabVC() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                let spalshVC = TabBarController()
                let navigationController = UINavigationController(rootViewController: spalshVC)
                window.rootViewController = navigationController
            }
        }
    }
}

extension LoginViewController: BackButtonProtocol {
    
    func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
}

extension LoginViewController {
    
    func postLogin(dto: LoginRequestDto) {
        AuthService.shared.postLogin(requestDto: dto){ response in
            guard let data = response?.data else { return }
            UserManager.shared.updateToken(data.token)
            UserManager.shared.updateUserName(data.nickname)
            self.changeRootToTabVC()
        }
    }
}
