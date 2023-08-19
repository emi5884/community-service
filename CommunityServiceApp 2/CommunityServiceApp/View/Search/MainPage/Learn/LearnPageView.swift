//
//  LearnView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/01.
//

import UIKit

class LearnPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let learn1 = Learn(image: #imageLiteral(resourceName: "field"), icon: #imageLiteral(resourceName: "airline_icon"), supplier: "航空会社",
                               title: "農業・酒造り", category: "地域留学", price: 0,
                               skills: ["農業実習", "酒造り実習", "地域づくり"], isCertificate: false)
    
    private let learn2 = Learn(image: #imageLiteral(resourceName: "lecture"), icon: #imageLiteral(resourceName: "univ_icon"), supplier: "武蔵野地域大学",
                               title: "国際関係学", category: "大学講義", price: 0,
                               skills: ["国際マネジメント", "マーケティング", "ICT時代の情報"], isCertificate: true)
    
    private let learn3 = Learn(image: #imageLiteral(resourceName: "programming"), icon: #imageLiteral(resourceName: "internet_icon"), supplier: "ウェブ広告会社",
                               title: "Go言語", category: "企業研修", price: 0,
                               skills: ["Goの言語使用", "クラウド", "サービス開発"],
                               isCertificate: false)
    
    private let learn4 = Learn(image: #imageLiteral(resourceName: "amusement_park"), icon: #imageLiteral(resourceName: "nezumipark"), supplier: "デパート",
                               title: "文化交流", category: "インターンシップ", price: 0,
                               skills: ["英語力, 国際的な視野", "第一線の接客スキル", "海外での就業経験"],
                               isCertificate: false)
    
//    private let learn5 = Learn(image: #imageLiteral(resourceName: "hand"), icon: #imageLiteral(resourceName: "volunteer_icon"), supplier: "ボランティアセンター",
//                               title: "手話", category: "ボランティア育成", price: 0,
//                               skills: ["手話", "", ""],
//                               isCertificate: false)
    
    private lazy var learns = [learn1, learn2, learn3, learn4]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let headerIdentifier = "headerIdentifier"
    private let space: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: space * 2, left: space, bottom: space, right: space)
        cv.backgroundColor = .backgroundColor
        cv.dataSource = self
        cv.delegate = self
        cv.register(LearnCell.self, forCellWithReuseIdentifier: identifier)
//        cv.register(LearnHeader.self,
//                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                    withReuseIdentifier: headerIdentifier)
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

extension LearnPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return learns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! LearnCell
        cell.viewModel = LearnCellViewModel(cell: learns[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
//                                                                     withReuseIdentifier: headerIdentifier,
//                                                                     for: indexPath) as! LearnHeader
//        return header
//    }
}

// MARK: - UICollectionViewDelegate

extension LearnPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension LearnPageView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width - space * 3) / 2, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return space
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return space
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: frame.width, height: 300)
//    }
}
