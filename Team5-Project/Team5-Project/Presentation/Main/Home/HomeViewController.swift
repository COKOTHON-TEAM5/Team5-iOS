//
//  HomeViewController.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private var totalSleepTime: Int = 0
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getReport()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
        getReport()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name("popHomeVC"),
                                                  object: nil)
    }
}

extension HomeViewController {
    
    func setUI() {
        self.navigationController?.navigationBar.isHidden = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(popHomeVC),
                                               name: NSNotification.Name("popHomeVC"),
                                               object: nil)
    }
    
    func setAddTarget() {
        homeView.sleepButton.addTarget(self, action: #selector(sleepButtonTapped), for: .touchUpInside)
        homeView.wakeButton.addTarget(self, action: #selector(sleepEndButtonTapped), for: .touchUpInside)
        homeView.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        homeView.passButton.addTarget(self, action: #selector(passButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func sleepButtonTapped() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        let isoDateString = dateFormatter.string(from: now)
        self.postSleepStart(dto: SleepStartRequestDto(time: isoDateString))
    }
    
    @objc
    func sleepEndButtonTapped() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        let isoDateString = dateFormatter.string(from: now)
        self.postSleepEnd(dto: SleepStartRequestDto(time: isoDateString))
    }
    
    @objc
    func completeButtonTapped() {
        let nav = DreamWriteViewController()
        nav.totalSleepTime = self.totalSleepTime
        nav.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    @objc
    func passButtonTapped() {
        self.postSkip()
    }
    
    @objc
    func popHomeVC() {
        self.getReport()
    }
    
}

extension HomeViewController {
    
    func postSleepStart(dto: SleepStartRequestDto) {
        DiaryService.shared.postSleepStart(requestDto: dto) { _ in
            print("sleep success")
            self.getReport()
        }
    }
    
    func postSleepEnd(dto: SleepStartRequestDto) {
        DiaryService.shared.postSleepEnd(requestDto: dto) { _ in
            print("sleep end")
            let nav = DreamWriteViewController()
            nav.totalSleepTime = self.totalSleepTime
            nav.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
    
    func postSkip() {
        DiaryService.shared.postSkip { _ in
            print("sleep skip")
            self.getReport()
        }
    }
    
    func getReport() {
        DiaryService.shared.getReport { response in
            guard let data = response?.data else { return }
            self.totalSleepTime = data.sleepTime
            self.homeView.bindHomeView(model: data)
        }
    }
}
