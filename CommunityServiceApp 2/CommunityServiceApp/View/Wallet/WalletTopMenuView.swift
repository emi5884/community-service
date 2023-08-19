//
//  WalletTopMenuView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/27.
//

import UIKit

protocol WalletTopViewDelegate {
    func showTipsView()
}

class WalletTopView: UIView {
    
    // MARK: - Property
    
    var delegate: WalletTopViewDelegate?
    private let identifier = "identifier"
    
    private let contents: [TopMenuModel] = [TopMenuModel(image: #imageLiteral(resourceName: "siren-thin"), text: "アラート"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "bank-card (1).png"), text: "履歴"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "lightbulb-thin"), text: "TIPS"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "send_wallet"), text: "送金"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "share_buy"), text: "シェア買い")]
    private let spacing: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        cv.register(WalletTopMenuCell.self, forCellWithReuseIdentifier: identifier)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .lightBackgroundColor
        return cv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension WalletTopView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! WalletTopMenuCell
        cell.viewModel = TopMenuViewModel(topMenu: contents[indexPath.row], num: indexPath.row, isMypage: false)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension WalletTopView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            delegate?.showTipsView()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension WalletTopView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (frame.width - spacing * 2) / 5
        return CGSize(width: width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
