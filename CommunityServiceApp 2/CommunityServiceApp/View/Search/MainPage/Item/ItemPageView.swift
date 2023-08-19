//
//  ItemPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class ItemPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let items = [Item(image: #imageLiteral(resourceName: "camp_item"), icon: #imageLiteral(resourceName: "camp_icon"), supplier: "野活センター", title: "キャンプ用品", price: 0),
                         Item(image: #imageLiteral(resourceName: "toy"), icon: #imageLiteral(resourceName: "kids_icon"), supplier: "こども協会", title: "おもちゃ", price: 0),
                         Item(image: #imageLiteral(resourceName: "sewing"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "ミシン", price: 0),
                         Item(image: #imageLiteral(resourceName: "drum"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "ドラム", price: 0),
                         Item(image: #imageLiteral(resourceName: "dish"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "お皿", price: 300),
                         Item(image: #imageLiteral(resourceName: "outdoor"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "ジャケット", price: 1000),
                         Item(image: #imageLiteral(resourceName: "desk"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "机", price: 2000),
                         Item(image: #imageLiteral(resourceName: "boots"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "ブーツ", price: 800),
                         Item(image: #imageLiteral(resourceName: "steam"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "スチーマー", price: 1000),
                         Item(image: #imageLiteral(resourceName: "printer"), icon: #imageLiteral(resourceName: "fablab1_icon"), supplier: "ファブラボ", title: "3Dプリンタ", price: 0),
                         Item(image: #imageLiteral(resourceName: "sofa"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "ソファ", price: 2000),
                         Item(image: #imageLiteral(resourceName: "memo"), icon: #imageLiteral(resourceName: "recycle_icon"), supplier: "リユーズセンター", title: "メモ帳", price: 100)]

    // MARK: - property

    private let identifier = "identifier"
    private let padding: CGFloat = 5

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(SmallCell.self, forCellWithReuseIdentifier: identifier)
        cv.contentInset = UIEdgeInsets(top: padding + 5, left: padding, bottom: padding, right: padding)
        cv.backgroundColor = .backgroundColor
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

extension ItemPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SmallCell
        cell.itemViewModel = ItemCellViewModel(cell: items[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ItemPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 25
        let width = (frame.width - padding) / 3
        return CGSize(width: width, height: width + padding * 3 - 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
