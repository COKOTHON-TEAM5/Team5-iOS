//
//  RecordDetailView.swift
//  Team5-Project
//
//  Created by KJ on 9/28/24.
//

import UIKit

import SnapKit
import Then

final class RecordDetailView: UIView {
    
    // MARK: - UI Components
    
    private let emotionImageView = UIImageView(image: .imgAngry)
    private let emotionDreamLabel = UILabel()
    
    private let dreamDateLabel = UILabel()
    private let dreamTimeLabel = UILabel()
    
    private let dreamTitleView = UIView()
    private let dreamTitleLabel = UILabel()
    private let dreamDetailView = UIView()
    private let dreamDetailLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecordDetailView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        emotionDreamLabel.do {
            $0.text = "이날은 설레는 꿈을 꿨어!"
            $0.textColor = .white
            $0.font = .fontGuide(type: .PyeongChangBold, size: 26)
            $0.partColorChange(targetString: "설레는 꿈", textColor: .mainSkyBlue)
        }
        
        dreamDateLabel.do {
            $0.text = "2024년 9월 28일"
            $0.textColor = .white
            $0.font = .fontGuide(type: .PyeongChangBold, size: 24)
        }
        
        dreamTimeLabel.do {
            $0.text = "총 수면 시간은 9시간"
            $0.textColor = .white
            $0.font = .fontGuide(type: .PyeongChangRegular, size: 20)
            $0.partColorChange(targetString: "9시간", textColor: .mainSkyBlue)
        }
        
        dreamTitleView.do {
            $0.backgroundColor = .blue800
            $0.makeCornerRound(radius: 12)
        }
        
        dreamTitleLabel.do {
            $0.text = "고아라가 나오는 꿈"
            $0.textColor = .white
            $0.font = .fontGuide(type: .PyeongChangBold, size: 16)
        }
        
        dreamDetailView.do {
            $0.backgroundColor = .blue800
            $0.makeCornerRound(radius: 12)
        }
        
        dreamDetailLabel.do {
            $0.text = """
                        아라야 ! 나랑 놀고 싶어도 그렇지 어떻게 꿈에서까지 나올 수 있니ㅣ?\n
                        이바보 바보~~~~~\n
                        우하하우히히 우하 하아후아후아
                        """
            $0.textColor = .white
            $0.font = .fontGuide(type: .PyeongChangBold, size: 14)
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(emotionImageView, emotionDreamLabel, dreamDateLabel, dreamTimeLabel,
                    dreamTitleView, dreamDetailView)
        dreamTitleView.addSubview(dreamTitleLabel)
        dreamDetailView.addSubview(dreamDetailLabel)
        
        emotionImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(25)
            $0.size.equalTo(90)
        }
        
        emotionDreamLabel.snp.makeConstraints {
            $0.top.equalTo(emotionImageView.snp.bottom).offset(10)
            $0.leading.equalTo(emotionImageView)
        }
        
        dreamDateLabel.snp.makeConstraints {
            $0.top.equalTo(emotionDreamLabel.snp.bottom).offset(22)
            $0.leading.equalTo(emotionImageView)
        }
        
        dreamTimeLabel.snp.makeConstraints {
            $0.top.equalTo(dreamDateLabel.snp.bottom).offset(5)
            $0.leading.equalTo(emotionImageView)
        }
        
        dreamTitleView.snp.makeConstraints {
            $0.top.equalTo(dreamTimeLabel.snp.bottom).offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        dreamTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
        
        dreamDetailView.snp.makeConstraints {
            $0.top.equalTo(dreamTitleView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            
            $0.height.equalTo(setDreamDetailViewSize(dreamDetailLabel.text ?? ""))
        }
        
        dreamDetailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
    }
    
    // MARK: - Methods
    
    private func setDreamDetailViewSize(_ text: String) -> Int {
        let string = text
        let viewSize = Int(string.size(withAttributes: [NSAttributedString.Key.font: UIFont.fontGuide(type: .PyeongChangBold, size: 14)]).height + 30)
        return viewSize
    }
    
    func setDataBind(_ model: Diary) {
        emotionImageView.image = Emotion.image(for: model.emotion)
        emotionDreamLabel.text = "이날은 \(model.emotion) 꿈을 꿨어!"
        emotionDreamLabel.partColorChange(targetString: model.emotion, textColor: .blue100)
        dreamTimeLabel.text = "총 수면 시간은 \(model.sleepTime)시간"
        dreamTimeLabel.partColorChange(targetString: "\(model.sleepTime)시간", textColor: .mainBlue)
        
        let dateString = model.date

        // DateFormatter 생성
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        // 문자열을 Date 객체로 변환
        if let date = dateFormatter.date(from: dateString) {
            // 새로운 출력 형식 설정
            dateFormatter.dateFormat = "yyyy년 M월 d일"
            
            let formattedDate = dateFormatter.string(from: date)
            dreamDateLabel.text = formattedDate
        }
        
        dreamTitleLabel.text = model.title
        dreamDetailLabel.text = model.content
    }

    
    // MARK: - @objc Methods
}
