//
//  RecordView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class RecordView: UIView {
    
    var monthBackButtonHandler: (() -> Void)?
    var monthRightButtonHandler: (() -> Void)?
    
    // MARK: - UI Components
    
    let monthTitle = {
        let label = UILabel()
        label.text = "2024.09"
        label.textColor = .white
        label.font = .fontGuide(type: .PyeongChangRegular, size: 24)
        return label
    }()
    
    let monthBackButton =  {
        let button = UIButton()
        button.setImage(.icLeft, for: .normal)
        return button
    }()
    
    let monthRightButton =  {
        let button = UIButton()
        button.setImage(.icRight, for: .normal)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth - 32, height: 89)
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(
            RecordCollectionViewCell.self,
            forCellWithReuseIdentifier: RecordCollectionViewCell.className
        )
        return cv
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecordView {
    
    func setUI() {
        backgroundColor = .mainBackground
    }
    
    func setHierarchy() {
        addSubviews(monthTitle, monthBackButton, monthRightButton, collectionView)
    }
    
    func setLayout() {
        monthTitle.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        monthBackButton.snp.makeConstraints {
            $0.trailing.equalTo(monthTitle.snp.leading).offset(-20)
            $0.centerY.equalTo(monthTitle)
            $0.size.equalTo(48)
        }
        
        monthRightButton.snp.makeConstraints {
            $0.leading.equalTo(monthTitle.snp.trailing).offset(20)
            $0.centerY.equalTo(monthTitle)
            $0.size.equalTo(48)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(monthTitle.snp.bottom).offset(25)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension RecordView {
    
    func setAddTarget() {
        monthBackButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        monthRightButton.addTarget(self, action: #selector(rightButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func backButtonDidTap() {
        monthBackButtonHandler?()
    }
    
    @objc
    func rightButtonDidTap() {
        monthRightButtonHandler?()
    }
}
