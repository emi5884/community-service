//
//  FundProjectView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/14.
//

import UIKit

class FundProjectPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let fund1 = Fund(image: #imageLiteral(resourceName: "firework"), icon: #imageLiteral(resourceName: "firework_icon"),
                             supplier: "地域振興協会",
                             vision: "冬の花火で地域を盛り上げたい",
                             message: "「冬に花火を打ち上げたい」というアイデアから始まったEaasプロジェクト。\n2200万円の支援金と2万5000人の来場者を集め、全国紙に「別府の奇策」と掲載されるなど反響を集める。\n2025年まで冬の風物詩として発展を続け、以降は行政への引き継ぎを目指しています。",
                             activity: "地域づくり", category: "市民活動団体")
    
    private let fund2 = Fund(image: #imageLiteral(resourceName: "dog"), icon: #imageLiteral(resourceName: "dog4_icon"),
                             supplier: "社団法人ハッピードッグ",
                             vision: "保護犬から始まる世界平和を",
                             message: "保健所から殺処分対象のワンコを引き出し、新しい家族に繋げています。",
                             activity: "殺処分対象犬の保護、譲渡活動", category: "非営利団体")
    
    private let fund3 = Fund(image: #imageLiteral(resourceName: "eco"), icon: #imageLiteral(resourceName: "plant_icon"),
                             supplier: "サステナブルポリマー株式会社",
                             vision: "干ばつに悩む世界中の農家を助けたい",
                             message: "最先端技術を駆使し、干ばつによる世界の水不足問題の解決を目指しています。",
                             activity: "干ばつ地域向け商品の開発", category: "スタートアップ")
    
    private lazy var funds = [fund1, fund2, fund3]
    
    // MARK: - Property
    
    private var isProject = false
    
    private let identifier = "identifier"
    private let padding: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(FundProjectCell.self, forCellWithReuseIdentifier: identifier)
        cv.contentInset = UIEdgeInsets(top: 0, left: padding, bottom: padding, right: padding)
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
    
    // MARK: - helper
    
    func setupCollectionView(isProject: Bool) {
        self.isProject = isProject
        collectionView.reloadData()
    }
}
    
// MARK: - UICollectionViewDataSource

extension FundProjectPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return funds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FundProjectCell
        cell.viewModel = FundCellViewModel(cell: funds[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension FundProjectPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            delegate?.showDetaileView(cell: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FundProjectPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - padding * 2, height: 190)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
