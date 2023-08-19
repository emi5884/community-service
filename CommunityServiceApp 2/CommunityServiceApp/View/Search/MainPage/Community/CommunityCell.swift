//
//  OtherPageCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class CommunityCell: UICollectionViewCell {
    
    // MARK: - Property
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let supplierLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 12)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 24)
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 16)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.adjustLineSpace()
        return label
    }()
    
    private let keywordLabel = KeywordView()
    
    private let bottomBar: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemGray
        iv.setHeight(0.5)
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let padding: CGFloat = 5
        
        addSubview(titleLabel)
        titleLabel.setHeight(50)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: padding,
                          paddingLeft: padding,
                          paddingRight: padding)
        
        addSubview(keywordLabel)
        keywordLabel.setHeight(50)
        keywordLabel.anchor(left: leftAnchor,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            paddingLeft: padding,
                            paddingBottom: padding,
                            paddingRight: padding)
        
        addSubview(imageView)
        imageView.setWidth(120)
        imageView.anchor(top: titleLabel.bottomAnchor,
                         left: leftAnchor,
                         bottom: keywordLabel.topAnchor,
                         paddingTop: padding,
                         paddingLeft: padding,
                         paddingBottom: padding)
        
        addSubview(contentsLabel)
        contentsLabel.anchor(top: imageView.topAnchor,
                             left: imageView.rightAnchor,
                             bottom: imageView.bottomAnchor,
                             right: rightAnchor,
                             paddingLeft: padding + 5)

        addSubview(bottomBar)
        bottomBar.anchor(left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingLeft: padding,
                         paddingRight: padding)
        bottomBar.setHeight(1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentsLabel.sizeToFit()
    }
}
