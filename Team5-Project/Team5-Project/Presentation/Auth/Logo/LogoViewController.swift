//
//  LogoViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//


import UIKit

final class LogoViewController: UIViewController {
    
    private let logoView = LogoView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = logoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
    }
}

extension LogoViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setAddTarget() {
        logoView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        logoView.signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    }
    
    @objc
    func loginTapped() {
        print("login")
    }
    
    @objc
    func signupTapped() {
        print("signup")
    }
}
