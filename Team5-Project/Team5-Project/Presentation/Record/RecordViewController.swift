//
//  RecordViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class RecordViewController: UIViewController {
    
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
}


extension RecordViewController: UICollectionViewDelegate {
    
}

extension RecordViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  RecordCollectionViewCell.dequeueReusableCell(collectionView: cv, indexPath: indexPath)
        return cell
    }
}
