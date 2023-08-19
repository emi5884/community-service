//
//  EventPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

class EventPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let des1 = "トップクラスの選手がパフォーマンスを行う世界最高峰のマウンテンバイク大会"
    private let des2 = "夏の夜に自然の中でピクニックをしながら映画を鑑賞するイベント"
    private let des3 = "地元の才能豊かなアーティストや国内外の有名なミュージシャンが出演する音楽イベント"
    private let des4 = "農場を自転車で巡り、食べ物・農業・サイクリングの喜びを祝う40キロのサイクリングイベント"
    
    private lazy var events = [Event(image: #imageLiteral(resourceName: "concert"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "自治体",
                                     title: "サマーコンサート", description: des3, price: 0, tags: []),
                               Event(image: #imageLiteral(resourceName: "joyride"), icon: #imageLiteral(resourceName: "drink_icon"), supplier: "飲料メーカー",
                                     title: "ジョイライド", description: des1, price: 0, tags: []),
                               Event(image: #imageLiteral(resourceName: "movie"), icon: #imageLiteral(resourceName: "movie_icon"), supplier: "ヤングコミュニティセンター",
                                     title: "シネマナイト", description: des2, price: 0, tags: []),
                               Event(image: #imageLiteral(resourceName: "slowfood"), icon: #imageLiteral(resourceName: "super_icon"), supplier: "スーパーマーケット",
                                     title: "スローフードサイクル", description: des4, price: 500, tags: [])]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let padding: CGFloat = 15
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(LongCell.self, forCellWithReuseIdentifier: identifier)
        cv.contentInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
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

extension EventPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! LongCell
        cell.eventViewModel = EventCellViewModel(cell: events[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension EventPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - padding * 2, height: 120 + padding * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
