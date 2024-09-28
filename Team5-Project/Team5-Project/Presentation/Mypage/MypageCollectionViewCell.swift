//
//  MypageCollectionViewCell.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class MypageCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib = false
    
    private let settingTitle = {
        let label = UILabel()
        label.textColor = .white
        label.font = .fontGuide(type: .PretandardBold, size: 15)
        label.textAlignment = .left
        return label
    }()
    
    private let divideView = {
        let view = UIView()
        view.backgroundColor = .gray400
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MypageCollectionViewCell {
     
    func setUI() {
        self.backgroundColor = .blue800
    }
    
    func setHierarchy() {
        addSubviews(settingTitle, divideView)
    }
    
    func setLayout() {
        settingTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        divideView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

extension MypageCollectionViewCell {
    
    func bindSetting(model: MypageMenuModel) {
        settingTitle.text = model.title
    }
}
