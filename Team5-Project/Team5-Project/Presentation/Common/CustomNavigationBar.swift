//
//  CustomNavigationBar.swift
//  Team5-Project
//
//  Created by 고아라 on 9/28/24.
//

import UIKit

import SnapKit

protocol BackButtonProtocol: AnyObject {
    
    func tapBackButton()
}

final class CustomNavigationBar: UIView {

    weak var delegate: BackButtonProtocol?
    
    // MARK: - Properties
    
    var isTitleLabelIncluded: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var isTitleViewIncluded: Bool {
        get { !titleView.isHidden }
        set { titleView.isHidden = !newValue }
    }
    
    var isBackButtonIncluded: Bool {
        get { !backButton.isHidden }
        set { backButton.isHidden = !newValue }
    }
    
    var backButtonAction: (() -> Void)?
    
    // MARK: - UI Components
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontGuide(type: .PretandardSemiBold, size: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.icLeft, for: .normal)
        button.isHidden = true
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension CustomNavigationBar {

    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierarchy() {
        self.addSubviews(backButton, titleView)
        titleView.addSubview(titleLabel)
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        titleView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(48)
        }
    }
    
    func setAddTarget() {
        backButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    
    @objc
    func isTapped(_ sender: UIButton) {
        delegate?.tapBackButton()
    }
}
