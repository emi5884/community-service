//
//  StoryCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/13.
//

import UIKit

class StoryPageCell: UICollectionViewCell {
    
    // MARK: - data
    
    private let images =  [#imageLiteral(resourceName: "dog4"),#imageLiteral(resourceName: "about_dog_2"),#imageLiteral(resourceName: "about_dog_1"), #imageLiteral(resourceName: "about_dog_3"), #imageLiteral(resourceName: "dog2"), #imageLiteral(resourceName: "about_dog_1"), #imageLiteral(resourceName: "dogrun1")]
//    private let images =  [#imageLiteral(resourceName: "firework2"),#imageLiteral(resourceName: "about_dog_1"), #imageLiteral(resourceName: "about_dog_3"), #imageLiteral(resourceName: "dog2"), #imageLiteral(resourceName: "about_dog_1"), #imageLiteral(resourceName: "dogrun1")]
    
    private let text = "私たちは、保健所で殺処分を待っている犬や猫をレスキューしている団体です。政治家の方々と殺処分について話をすると最終的には予算の壁に行き当たります。サポーターになっていただきご支援いただければ、より多くの犬猫をレスキューできるだけでなく、日本から殺処分をなくすことができるかもしれません。最低800万円と言われる殺処分機のランニングコストは私たちの税金から支払われています。"
    
//    private let text = "「冬に花火を打ち上げて地域を盛り上げたい」という青年のアイデアから始まったプロジェクト。\n初年度の開催では2200万円の支援金と2万5000人の来場者を集め、全国紙に「六府市の奇策」と掲載されるなど反響を集める。\n2025年まで冬の風物詩として発展を続け、以降は行政への引き継ぎを目指しています。"
    
    // MARK: - property
    
    private let titleLael: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 24)
        label.textAlignment = .center
        label.textColor = .titleTextColor
        return label
    }()
                                 
    private lazy var pageView = PageView(frame: .zero, images: images)
    
    private lazy var textView: UITextView = {
        let tv = UITextView()
        tv.text = text
        tv.textColor = .systemGray
        tv.font = .zenKakuMedium(size: 16)
        tv.textColor = .darkGray
        return tv
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let padding: CGFloat = 5
        
        addSubview(pageView)
        pageView.anchor(top: topAnchor,
                        left: leftAnchor,
                        right: rightAnchor,
                        paddingTop: padding)
        pageView.setHeight(240)
        
        addSubview(textView)
        textView.anchor(top: pageView.bottomAnchor,
                        left: leftAnchor,
                        bottom: bottomAnchor,
                        right: rightAnchor,
                        paddingTop: -25,
                        paddingLeft: padding,
                        paddingBottom: padding,
                        paddingRight: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
