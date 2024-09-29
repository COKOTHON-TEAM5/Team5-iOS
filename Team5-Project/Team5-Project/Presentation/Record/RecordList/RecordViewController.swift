//
//  RecordViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class RecordViewController: UIViewController {
    
    // MARK: - Properties
    
    var year: Int = 2024
    var month: Int = 9
    var recordData: RecordResponseDto = RecordResponseDto(diaries: [])
    
    // MARK: - UI Components Property
    
    private let recordView = RecordView()
    private lazy var cv = recordView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = recordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        getRecord()
        setDate()
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getRecord()
    }
}

extension RecordViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setDelegate() {
        cv.delegate = self
        cv.dataSource = self
    }
    
    func pushToRecordDetailVC(_ recordData: Diary) {
        let vc = RecordDetailViewController()
        vc.data = recordData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setDate() {
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        let year = yearFormatter.string(from: Date())
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        let month = monthFormatter.string(from: Date())
        
        guard let year = Int(year) else { return }
        guard let month = Int(month) else { return }
        
        recordView.monthTitle.text = "\(year)년 \(month)월"
    }
    
    func backButtonTapped() {
        if self.month > 1 {
            self.month -= 1
            recordView.monthTitle.text = "\(year)년 \(month)월"
            getRecord()
        }
    }
    
    func rightButtonTapped() {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        let nowMonth = monthFormatter.string(from: Date())
        
        guard let nowMonth = Int(nowMonth) else { return }
        
        if nowMonth > self.month {
            self.month += 1
            recordView.monthTitle.text = "\(year)년 \(month)월"
            getRecord()
        }
    }
    
    @objc
    private func setButton() {
        recordView.monthBackButtonHandler = { [weak self] in
            self?.backButtonTapped()
        }
        
        recordView.monthRightButtonHandler = { [weak self] in
            self?.rightButtonTapped()
        }
    }
}


extension RecordViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recordDetailData = recordData.diaries[indexPath.item]
        pushToRecordDetailVC(recordDetailData)
    }
}

extension RecordViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recordData.diaries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  RecordCollectionViewCell.dequeueReusableCell(collectionView: cv, indexPath: indexPath)
        cell.bindRecord(recordData.diaries[indexPath.item])
        return cell
    }
}

extension RecordViewController {
    
    func getRecord() {
        RecordService.shared.getRecord(year: self.year, month: self.month) { response in
            guard let data = response?.data else { return }
            self.recordData = data
            self.cv.reloadData()
            print("🐥🐥🐥🐥🐥🐥🐥🐥🐥🐥🐥🐥🐥🐥🐥", self.recordData)
        }
    }
}
