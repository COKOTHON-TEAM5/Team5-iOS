//
//  SignupViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class SignupViewController: UIViewController {
    
    private let signupView = SignupView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
        setDelegate()
        setGesture()
    }
}

extension SignupViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setAddTarget() {
        signupView.signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        signupView.checkButton.addTarget(self, action: #selector(checkTapped), for: .touchUpInside)
    }
    
    func setDelegate() {
        signupView.navigationBar.delegate = self
        signupView.idTextField.delegate = self
        signupView.pwTextField.delegate = self
        signupView.nicknameTextField.delegate = self
    }
    
    @objc
    func signupTapped() {
        self.postSignup(dto: SignupRequestDto(username: signupView.idTextField.text ?? "", password: signupView.pwTextField.text ?? "", nickname: signupView.nicknameTextField.text ?? ""))
    }
    
    @objc
    func checkTapped() {
        self.checkUsername(name: signupView.idTextField.text ?? "")
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
                let tabVC = TabBarController()
                let navigationController = UINavigationController(rootViewController: tabVC)
                window.rootViewController = navigationController
            }
        }
    }
}

extension SignupViewController: BackButtonProtocol {
    
    func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
}

extension SignupViewController {
    
    func postSignup(dto: SignupRequestDto) {
        AuthService.shared.postSignup(requestDto: dto) { response in
            guard let data = response?.data else { return }
            UserManager.shared.updateToken(data.token)
            UserManager.shared.updateUserName(data.nickname)
            self.changeRootToTabVC()
        }
    }
    
    func checkUsername(name: String) {
//        AuthService.shared.getCheckUsername(name: name) { response in
//            print("sdkfkdkfkdsk")
//            print(response ?? false)
//            DispatchQueue.main.async {
//                self.signupView.checkButton.isEnabled = !(response ?? false)
//            }
//        }
    }
}
