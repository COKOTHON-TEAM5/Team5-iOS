//
//  HomeViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
}

extension HomeViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
}
