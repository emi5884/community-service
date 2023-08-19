//
//  ItemPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class FoodPageView: UICollectionViewCell {

    // MARK: - data

    private let foods = [Food(image: #imageLiteral(resourceName: "snacks"), icon: #imageLiteral(resourceName: "game_icon"), supplier: "パチンコ店", title: "スナック菓子3袋", label: "¥50"),
                         Food(image: #imageLiteral(resourceName: "chicken"), icon: #imageLiteral(resourceName: "chicken_icon"), supplier: "食肉衛生組合", title: "チキン100g", label: "20%off"),
                         Food(image: #imageLiteral(resourceName: "corn"), icon: #imageLiteral(resourceName: "restaurant_icon"), supplier: "飲食店", title: "とうもろこし２本", label: "¥100"),
                         Food(image: #imageLiteral(resourceName: "icecream"), icon: #imageLiteral(resourceName: "ice_icon"), supplier: "アイスショップ", title: "アイスクリーム", label: "¥80〜"),
                         Food(image: #imageLiteral(resourceName: "bread"), icon: #imageLiteral(resourceName: "bread_icon"), supplier: "パン屋さん", title: "パン詰め合わせ", label: "¥300〜"),
                         Food(image: #imageLiteral(resourceName: "candy"), icon: #imageLiteral(resourceName: "candy_icon"), supplier: "キャンディショップ", title: "キャンディ５袋", label: "¥200"),
                         Food(image: #imageLiteral(resourceName: "fish"), icon: #imageLiteral(resourceName: "super_icon"), supplier: "スーパー", title: "缶詰", label: "¥80〜"),
                         Food(image: #imageLiteral(resourceName: "source"), icon: #imageLiteral(resourceName: "super_icon"), supplier: "スーパー", title: "パスタソース", label: "¥50〜"),
                         Food(image: #imageLiteral(resourceName: "peach"), icon: #imageLiteral(resourceName: "villege_icon"), supplier: "ファーマー", title: "桃詰め合わせ", label: "¥150〜"),
                         Food(image: #imageLiteral(resourceName: "kiwi"), icon: #imageLiteral(resourceName: "villege_icon"), supplier: "ファーマー", title: "キウイ10個", label: "¥100〜"),
                         Food(image: #imageLiteral(resourceName: "coffee"), icon: #imageLiteral(resourceName: "drink_icon2"), supplier: "カフェ", title: "コーヒー", label: "¥150〜"),
                         Food(image: #imageLiteral(resourceName: "okome"), icon: #imageLiteral(resourceName: "inc"), supplier: "ファーマー", title: "お米", label: "30%off")]

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

extension FoodPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SmallCell
        cell.foodViewModel = FoodCellViewModel(cell: foods[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FoodPageView: UICollectionViewDelegateFlowLayout {
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
