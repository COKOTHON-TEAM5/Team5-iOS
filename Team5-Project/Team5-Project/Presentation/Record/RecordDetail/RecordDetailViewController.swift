//
//  RecordDetailViewController.swift
//  Team5-Project
//
//  Created by KJ on 9/28/24.
//

import UIKit

import Moya
import SnapKit
import Then

final class RecordDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar()
    private let recordDetailView = RecordDetailView()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension RecordDetailViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        self.view.backgroundColor = .mainBackground
        
        navigationBar.do {
            $0.isBackButtonIncluded = true
            $0.isTitleViewIncluded = true
            $0.isTitleLabelIncluded = "꿈 기록"
            $0.backgroundColor = .mainBackground
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        self.view.addSubviews(navigationBar, recordDetailView)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        recordDetailView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
