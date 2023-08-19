//
//  OtherPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class CommunityPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let comDes1 = "様々な文化、習慣を持った人々が互いに尊重し、共生していく多文化共生社会の実現に向けて活動を続けています。"
    private let comDes2 = "小型コンピュータRaspberry Piを使い、ハードウェア・ソフトウェア・ネットワークを勉強しています。"
    private let comDes3 = "自分自身の可能性やすばらしさと出会う機会となるようアウトドアプログラムを提供しています。"
    
    private lazy var com1 = Community(image: #imageLiteral(resourceName: "world"), icon: #imageLiteral(resourceName: "international_icon"),
                                      supplier: "国際交流協会",
                                      title: "国際交流", description: comDes1,
                                      tags: ["多文化共生", "国際平和", "まちづくり"])
    
    private lazy var com2 = Community(image: #imageLiteral(resourceName: "outdoorCamp"), icon: #imageLiteral(resourceName: "camp_icon"),
                                      supplier: "NPO法人アースマンシップ",
                                      title: "アウトドア活動", description: comDes3,
                                      tags: ["自然", "森", "川", "キャンプ"])
    
    private lazy var com3 = Community(image: #imageLiteral(resourceName: "pi"), icon: #imageLiteral(resourceName: "code_icon"),
                                      supplier: "Raspberry Pi サークル",
                                      title: "プログラミング学習", description: comDes2,
                                      tags: ["Python", "IoT", "AI", "Django"])
    
    private lazy var communities = [com1, com2, com3]
    
    private let proDes1 = "「冬に花火を打ち上げたい」\n地元の青年のアイデアから企画が始まりました。一緒に別府で冬の花火大会を実現しませんか？"
    private let proDes2 = "保護犬から始まる世界平和を。すべての生き物が幸せに暮らしていける世界を目指しています。"
    private let proDes3 = "「」"
    
    
    private lazy var pro1 = Community(image: #imageLiteral(resourceName: "world"), icon: #imageLiteral(resourceName: "world"),
                                      supplier: "地域振興協会",
                                      title: "クリスマス花火ファンタジア", description: proDes1,
                                      tags: ["Eaas", "地域づくり", "花火"])
    
    private lazy var pro2 = Community(image: #imageLiteral(resourceName: "pi"), icon: #imageLiteral(resourceName: "pi"),
                                      supplier: "社団法人ハッピーテイルズ",
                                      title: "殺処分対象犬の保護、譲渡活動", description: proDes2,
                                      tags: ["殺処分", "保護犬", "アニマルシェルター"])
    
    private lazy var pro3 = Community(image: #imageLiteral(resourceName: "outdoorCamp"), icon: #imageLiteral(resourceName: "outdoorCamp"),
                                      supplier: "NPO法人アースマンシップ",
                                      title: "干ばつに悩む家族・世界中のカマを助けたい", description: proDes3,
                                      tags: ["自然", "森", "川", "キャンプ"])
    
    private lazy var projects = [pro1, pro2, pro3]
    
    // MARK: - Property
    
    private var isProject = false
    
    private let identifier = "identifier"
    private let padding: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(LongCell.self, forCellWithReuseIdentifier: identifier)
        cv.contentInset = UIEdgeInsets(top: 15, left: padding, bottom: padding, right: padding)
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
    
    // MARK: - helper
    
    func setupCollectionView(isProject: Bool) {
        self.isProject = isProject
        collectionView.reloadData()
    }
}
    
// MARK: - UICollectionViewDataSource

extension CommunityPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isProject ? projects.count : communities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! LongCell
        cell.isCommunity = true
        cell.communityViewModel = CommunityCellViewModel(cell: communities[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CommunityPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            delegate?.showDetaileView(cell: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CommunityPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - padding * 2, height: 190)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
