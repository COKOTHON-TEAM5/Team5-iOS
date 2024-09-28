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
    }
    
    func setDelegate() {
        signupView.navigationBar.delegate = self
        signupView.idTextField.delegate = self
        signupView.pwTextField.delegate = self
        signupView.nicknameTextField.delegate = self
    }
    
    @objc
    func signupTapped() {
        print(signupView.idTextField.text ?? "")
        print(signupView.pwTextField.text ?? "")
        print(signupView.nicknameTextField.text ?? "")
    }
    
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
