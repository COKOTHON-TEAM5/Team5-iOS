//
//  DreamWriteView.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

final class DreamWriteView: UIView {
    
    let navigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isBackButtonIncluded = true
        navigationBar.isTitleViewIncluded = true
        navigationBar.isTitleLabelIncluded = "기록하기"
        return navigationBar
    }()
    
    private let todayDateView = {
        let label = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        label.text = formattedDate
        label.textColor = .white
        label.font = .fontGuide(type: .PretandardBold, size: 24)
        return label
    }()
    
    let todaySleepTime = {
        let label = UILabel()
        label.text = "총 수면 시간은 9시간"
        label.textColor = .white
        label.font = .fontGuide(type: .PyeongChangRegular, size: 20)
        label.partColorChange(targetString: "9시간", textColor: .mainSkyBlue)
        return label
    }()
    
    private let dreamWriteTitle = {
        let label = UILabel()
        label.text = "오늘 꾼 꿈은 어땠어?"
        label.textColor = .gray200
        label.font = .fontGuide(type: .PyeongChangRegular, size: 15)
        return label
    }()
    
    private let cvBackView = {
        let view = UIView()
        view.backgroundColor = .blue800
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 80)
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(
            DreamWriteCollectionViewCell.self,
            forCellWithReuseIdentifier: DreamWriteCollectionViewCell.className
        )
        return cv
    }()
    
    let titleTextField = CustomTextField(placeHolder: "꿈 제목")
    
    private let contentBackView = {
        let view = UIView()
        view.backgroundColor = .blue800
        view.layer.cornerRadius = 12
        return view
    }()
    
    let contentTextView = {
        let textView = UITextView()
        textView.text = "어떤 꿈을 꿨는지 적어주세요!"
        textView.font = .fontGuide(type: .PretandardRegular, size: 14)
        textView.textColor = .gray500
        textView.textContainer.maximumNumberOfLines = 5
        textView.showsVerticalScrollIndicator = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    let dreamWritebutton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitle("등록하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .fontGuide(type: .PretandardSemiBold, size: 18)
        button.layer.cornerRadius = 12
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DreamWriteView {
    
    func setUI() {
        backgroundColor = .mainBackground
        titleTextField.backgroundColor = .blue800
        titleTextField.textColor = .white
    }
    
    func setHierarchy() {
        addSubviews(navigationBar, todayDateView, todaySleepTime, dreamWriteTitle, cvBackView, titleTextField, contentBackView, dreamWritebutton)
        contentBackView.addSubview(contentTextView)
        cvBackView.addSubview(collectionView)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        todayDateView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(25)
        }
        
        todaySleepTime.snp.makeConstraints {
            $0.top.equalTo(todayDateView.snp.bottom).offset(5)
            $0.leading.equalTo(todayDateView.snp.leading)
        }
        
        dreamWriteTitle.snp.makeConstraints {
            $0.top.equalTo(todaySleepTime.snp.bottom).offset(27)
            $0.leading.equalTo(todaySleepTime.snp.leading)
        }
        
        cvBackView.snp.makeConstraints {
            $0.top.equalTo(dreamWriteTitle.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(105)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(cvBackView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        contentBackView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(142)
        }
        
        contentTextView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 56)
            $0.height.equalTo(110)
        }
        
        dreamWritebutton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.height.equalTo(54)
        }
    }
    
    func setDelegate() {
        contentTextView.delegate = self
    }
    
    func checkMaxLength(_ textView: UITextView) {
        
        let maxLength = 100
        if textView.text.count > maxLength {
            textView.deleteBackward()
        }
        
        if textView.numberOfLines() < 6 {
            textView.isEditable = true
        } else {
            textView.deleteBackward()
        }
    }
}

extension DreamWriteView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray500 {
            textView.text = nil
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "어떤 꿈을 꿨는지 적어주세요!"
            textView.textColor = .gray500
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: self.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if estimatedSize.height >= 277 {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
        checkMaxLength(textView)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
}
