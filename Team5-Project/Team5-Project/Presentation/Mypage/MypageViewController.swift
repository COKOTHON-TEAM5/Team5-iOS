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
    
    func changeRootToSplashVC() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                let spalshVC = SplashViewController()
                let navigationController = UINavigationController(rootViewController: spalshVC)
                window.rootViewController = navigationController
            }
        }
    }
}


extension MypageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            print("공지사항")
        case 1:
            print("약관정책")
        case 2:
            print("개발자소개")
        case 3:
            print("로그아웃")
            UserManager.shared.logout()
            self.changeRootToSplashVC()
        case 4:
            print("탈퇴하기")
            UserManager.shared.withdraw()
            self.changeRootToSplashVC()
        default:
            break
        }
    }
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
