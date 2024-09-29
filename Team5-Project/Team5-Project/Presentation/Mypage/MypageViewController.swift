//
//  MypageViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SafariServices

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
            if let url = URL(string: "https://srchotion.notion.site/d5c078fb01104a0aa4c6096e77eadf52?pvs=4") {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true, completion: nil)
            }
        case 1:
            if let url = URL(string: "https://srchotion.notion.site/c5e600cb29bc4298b2e40fc7c552e1ad?pvs=4") {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true, completion: nil)
            }
        case 2:
            if let url = URL(string: "https://srchotion.notion.site/848438b9fbca43d0a25d40f1b346dbb4?pvs=4") {
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true, completion: nil)
            }
        case 3:
            UserManager.shared.logout()
            self.changeRootToSplashVC()
        case 4:
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
