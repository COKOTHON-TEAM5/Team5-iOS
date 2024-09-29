//
//  DreamWriteViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class DreamWriteViewController: UIViewController {
    
    private let dreamWriteView = DreamWriteView()
    private lazy var cv = dreamWriteView.collectionView
    private let model = Emotion.emotionData()
    private var selectedEmotionIndex: Int = 0
    var totalSleepTime: Int = 0
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = dreamWriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
        setAddTarget()
    }
}

extension DreamWriteViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        dreamWriteView.todaySleepTime.text = "총 수면 시간은 \(totalSleepTime)시간"
        dreamWriteView.todaySleepTime.partColorChange(targetString: "\(totalSleepTime)시간", textColor: .mainSkyBlue)
    }
    
    func setDelegate() {
        cv.delegate = self
        cv.dataSource = self
        dreamWriteView.navigationBar.delegate = self
    }
    
    func setAddTarget() {
        dreamWriteView.dreamWritebutton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func writeButtonTapped() {
        guard let emotionName = Emotion.name(for: self.selectedEmotionIndex) else { return }
        postWrite(dto: WriteRequstDto(title: dreamWriteView.titleTextField.text ?? "", emotion: emotionName, content: dreamWriteView.contentTextView.text ?? ""))
    }
    
    func popToHomeVC() {
        NotificationCenter.default.post(name: NSNotification.Name("popHomeVC"),
                                        object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}

extension DreamWriteViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
            cv.deselectItem(at: selectedIndexPath, animated: false)
            if let deselectedCell = collectionView.cellForItem(at: selectedIndexPath) as? DreamWriteCollectionViewCell {
                deselectedCell.isSelected = false
            }
        }
        if let selectedCell = cv.cellForItem(at: indexPath) as? DreamWriteCollectionViewCell {
            selectedCell.isSelected = true
            selectedEmotionIndex = indexPath.item
        }
        return true
    }
}

extension DreamWriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  DreamWriteCollectionViewCell.dequeueReusableCell(collectionView: cv, indexPath: indexPath)
        cell.bindEmotion(model: model[indexPath.item])
        return cell
    }
}

extension DreamWriteViewController: BackButtonProtocol {
    
    func tapBackButton() {
        popToHomeVC()
    }
}

extension DreamWriteViewController {
    
    func postWrite(dto: WriteRequstDto) {
        DiaryService.shared.postWrite(requestDto: dto) { _ in
            self.popToHomeVC()
        }
    }
}
