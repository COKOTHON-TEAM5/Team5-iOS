//
//  MypageView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class MypageView: UIView {
    
    // MARK: - UI Components
    
    private let profileImage = UIImageView(image: .imgIcon)
    
    private let userNameLabel = {
        let label = UILabel()
        label.text = "눈아파"
        label.textColor = .white
        label.font = .fontGuide(type: .PyeongChangBold, size: 24)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth, height: 60)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(
            MypageCollectionViewCell.self,
            forCellWithReuseIdentifier: MypageCollectionViewCell.className
        )
        return cv
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

extension MypageView {
    
    func setUI() {
        backgroundColor = .mainBackground
    }
    
    func setHierarchy() {
        addSubviews(profileImage, userNameLabel, collectionView)
    }
    
    func setLayout() {
        profileImage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(67)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(85)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
