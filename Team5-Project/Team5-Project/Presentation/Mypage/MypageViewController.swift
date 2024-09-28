//
//  MypageViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class MypageViewController: UIViewController {
    
    private let mypageView = MypageView()
    private lazy var cv = mypageView.collectionView
    private let model = MypageMenuModel.mypageMenu()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = mypageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setDelegate()
    }
}

extension MypageViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setDelegate() {
        cv.delegate = self
        cv.dataSource = self
    }
}


extension MypageViewController: UICollectionViewDelegate {
    
}

extension MypageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  MypageCollectionViewCell.dequeueReusableCell(collectionView: cv, indexPath: indexPath)
        cell.bindSetting(model: model[indexPath.item])
        return cell
    }
}
