////
////  ItemPageView.swift
////  CommunityServiceApp
////
////  Created by kobayashi emino on 2023/06/21.
////
//
//import UIKit
//
//class SpacePageView2: UICollectionViewCell {
//
//    // MARK: - data
//
//    private let spaces = [Food(image: #imageLiteral(resourceName: "zoo"), icon: #imageLiteral(resourceName: "zoo"), supplier: "動物園協会", title: "自然文化園", price: 0),
//                         Food(image: #imageLiteral(resourceName: "gim"), icon: #imageLiteral(resourceName: "gim"), supplier: "武蔵野市", title: "ジム", price: 0),
//                         Food(image: #imageLiteral(resourceName: "onsen"), icon: #imageLiteral(resourceName: "onsen"), supplier: "別府市", title: "温泉", price: 100),
//                         Food(image: #imageLiteral(resourceName: "fujino"), icon: #imageLiteral(resourceName: "fujino"), supplier: "青少年協会", title: "アトリエ", price: 0),
//                         Food(image: #imageLiteral(resourceName: "science"), icon: #imageLiteral(resourceName: "science"), supplier: "小金井市", title: "科学館", price: 0),
//                         Food(image: #imageLiteral(resourceName: "fablab"), icon: #imageLiteral(resourceName: "fablab"), supplier: "STEM学習協会", title: "ファブラボ", price: 0),
//                         Food(image: #imageLiteral(resourceName: "park"), icon: #imageLiteral(resourceName: "park"), supplier: "武蔵野市", title: "ストリート広場", price: 0),
//                         Food(image: #imageLiteral(resourceName: "camp"), icon: #imageLiteral(resourceName: "camp"), supplier: "武蔵野市", title: "キャンプ場", price: 0),
//                         Food(image: #imageLiteral(resourceName: "planet"), icon: #imageLiteral(resourceName: "planet"), supplier: "那覇市", title: "プラネタリウム", price: 0)]
//
//    // MARK: - Property
//
//    private let identifier = "identifier"
//
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.delegate = self
//        cv.dataSource = self
//        cv.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
//        cv.register(SmallCell.self, forCellWithReuseIdentifier: identifier)
//        return cv
//    }()
//
//    // MARK: - lifecycle
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addSubview(collectionView)
//        collectionView.fillSuperview()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//// MARK: - UICollectionViewDataSource
//
//extension FoodPageView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return spaces.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SmallCell
//        cell.viewModel = SmallCellViewModel(cell: spaces[indexPath.row])
//        return cell
//    }
//}
//
//// MARK: - UICollectionViewDelegateFlowLayout
//
//extension FoodPageView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (frame.width - 25) / 3
//        return CGSize(width: width, height: width + 75)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//}
