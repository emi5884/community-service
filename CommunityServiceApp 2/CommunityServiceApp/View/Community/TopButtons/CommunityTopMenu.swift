//
//  topButtons.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

protocol CommunityTopMenuDelegate {
    func didTapWallet()
}

class CommunityTopMenu: UIView {
    
    // MARK: - Property
    
    var delegate: CommunityTopMenuDelegate?
    private let identifier = "identifier"
    private let mypageIdentifier = "mypageIdentifier"
    private var contents: [TopMenuModel] = []
    private let spacing: CGFloat = 15
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MypageTopMenuCell.self, forCellWithReuseIdentifier: mypageIdentifier)
        cv.register(CommunityTopMenuCell.self, forCellWithReuseIdentifier: identifier)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private var isMypage: Bool = false
    
    // MARK: - lifecycle
    
    init(frame: CGRect, contents: [TopMenuModel], isMypage: Bool) {
        self.isMypage = isMypage
        self.contents = contents
        
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        if isMypage {
//            collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension CommunityTopMenu: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isMypage {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mypageIdentifier, for: indexPath) as! MypageTopMenuCell
            cell.viewModel = TopMenuViewModel(topMenu: contents[indexPath.row], num: indexPath.row, isMypage: isMypage)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CommunityTopMenuCell
            cell.viewModel = TopMenuViewModel(topMenu: contents[indexPath.row], num: indexPath.row, isMypage: isMypage)
            return cell
        }
        
    }
}

// MARK: - UICollectionViewDelegate

extension CommunityTopMenu: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            delegate?.didTapWallet()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CommunityTopMenu: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = getCategoryWidth(category: contents[indexPath.row].text) + 25
        return CGSize(width: width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
