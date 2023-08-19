//
//  PageCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/13.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var image: UIImage? {
        didSet { mainImageView.image = image }
    }
    
    private lazy var mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        mainImageView.anchor(top: topAnchor,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor,
                             paddingTop: 10,
                             paddingLeft: 20,
                             paddingBottom: 20,
                             paddingRight: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
