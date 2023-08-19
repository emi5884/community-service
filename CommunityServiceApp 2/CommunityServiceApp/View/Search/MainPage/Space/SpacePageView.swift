//
//  ItemPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class SpacePageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let spaces = [Space(image: #imageLiteral(resourceName: "fablab"), icon: #imageLiteral(resourceName: "fablab1_icon"), supplier: "STEM協会", title: "ファブラボ", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "zoo"), icon: #imageLiteral(resourceName: "zoo_icon"), supplier: "動物園協会", title: "動物園", label:"¥0〜￥400"),
                          Space(image: #imageLiteral(resourceName: "onsen"), icon: #imageLiteral(resourceName: "onsen_icon"), supplier: "鹿野府市", title: "温泉", label: "¥100"),
                          Space(image: #imageLiteral(resourceName: "cabin"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "キャンプ場", label: "¥100〜¥200"),
                          Space(image: #imageLiteral(resourceName: "planet"), icon: #imageLiteral(resourceName: "space_icon"), supplier: "野覇島市", title: "プラネタリウム", label: "¥100〜¥200"),
                          Space(image: #imageLiteral(resourceName: "gim"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "ジム", label: "¥200"),
                          Space(image: #imageLiteral(resourceName: "science"), icon: #imageLiteral(resourceName: "science_icon"), supplier: "武別那市", title: "科学館", label: "¥210〜¥520"),
                          Space(image: #imageLiteral(resourceName: "park"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "ストリート広場", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "kichen"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "キッチン", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "budou"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "道場", label: "¥200"),
                          Space(image: #imageLiteral(resourceName: "kids"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "キッズスペース", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "bolda"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市", title: "ボルダリング", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "art"), icon: #imageLiteral(resourceName: "atrie_icon"), supplier: "青少年協会", title: "アトリエ", label: "¥1000")]
    
    // MARK: - Property
    
    private let identifier = "identifier"
    private let padding: CGFloat = 5
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: padding + 5, left: padding, bottom: padding, right: padding)
        cv.register(SmallCell.self, forCellWithReuseIdentifier: identifier)
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

extension SpacePageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spaces.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SmallCell
        cell.spaceViewModel = SpaceCellViewModel(cell: spaces[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SpacePageView: UICollectionViewDelegateFlowLayout {
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
