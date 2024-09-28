//
//  DreamWriteCollectionViewCell.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class DreamWriteCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib = false
    
    override var isSelected: Bool {
        didSet {
            emotionTitle.textColor = isSelected ? .yellow100 : .gray200
            emotionTitle.font = isSelected ? .fontGuide(type: .PretandardBold, size: 10) : .fontGuide(type: .PretandardRegular, size: 10)
        }
    }
    
    private let emotionImage = UIImageView()
    
    private let emotionTitle = {
        let label = UILabel()
        label.textColor = .gray200
        label.font = .fontGuide(type: .PyeongChangRegular, size: 10)
        label.textAlignment = .center
        return label
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
    
    override func prepareForReuse() {
        isSelected = false
    }
}

private extension DreamWriteCollectionViewCell {
     
    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        addSubviews(emotionImage,
                    emotionTitle)
    }
    
    func setLayout() {
        emotionImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        emotionTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}

extension DreamWriteCollectionViewCell {
    
    func bindEmotion(model: (UIImage, String)) {
        emotionImage.image = model.0
        emotionTitle.text = model.1
    }
}
