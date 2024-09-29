//
//  RecordCollectionViewCell.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class RecordCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib = false
    
    private let recordIcon = UIImageView(image: .imgIcon)
    
    private let recordTitle = {
        let label = UILabel()
        label.text = "행복한 코코톤 이슈"
        label.textColor = .white
        label.font = .fontGuide(type: .PretandardBold, size: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let recordDate = {
        let label = UILabel()
        label.text = "2024년 9월 27일"
        label.textColor = .white
        label.font = .fontGuide(type: .PyeongChangRegular, size: 12)
        label.textAlignment = .left
        return label
    }()
    
    private let recordDetailImage = UIImageView(image: .icDetail)
    
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

private extension RecordCollectionViewCell {
     
    func setUI() {
        self.backgroundColor = .blue800
        self.layer.cornerRadius = 12
    }
    
    func setHierarchy() {
        addSubviews(recordIcon, recordTitle, recordDate, recordDetailImage)
    }
    
    func setLayout() {
        recordIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.size.equalTo(59)
        }
        
        recordTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalTo(recordIcon.snp.trailing).offset(10)
        }
        
        recordDate.snp.makeConstraints {
            $0.top.equalTo(recordTitle.snp.bottom).offset(10)
            $0.leading.equalTo(recordTitle.snp.leading)
        }
        
        recordDetailImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(48)
        }
    }
}

extension RecordCollectionViewCell {
    
    func bindRecord(_ model: Diary) {
        recordTitle.text = model.title
        recordIcon.image = Emotion.image(for: model.emotion)
        
        let dateString = model.date

        // DateFormatter 생성
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        // 문자열을 Date 객체로 변환
        if let date = dateFormatter.date(from: dateString) {
            // 새로운 출력 형식 설정
            dateFormatter.dateFormat = "yyyy년 M월 d일"
            
            let formattedDate = dateFormatter.string(from: date)
            recordDate.text = formattedDate
        }
        
    }
}

