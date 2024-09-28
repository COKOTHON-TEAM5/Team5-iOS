//
//  SplashViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class SplashViewController: UIViewController {
    
    private let splashImage = UIImageView(image: .imgSplash)
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            self.checkToken()
        }
    }
    
}

extension SplashViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(splashImage)
        splashImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(140)
        }
    }
    
    func checkToken() {
        let nav = TabBarController()
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
