//
//  WalletTopMenuCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/28.
//

import UIKit

class WalletTopMenuCell: UICollectionViewCell {
    
    // MARK: - property
    
    var viewModel: TopMenuViewModel? {
        didSet { configureUI() }
    }
    
    private let iconBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let iconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 13)
        label.textColor = .titleTextColor
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 10
        let iconBackgroundWidth: CGFloat = frame.width - padding
        let iconWidth: CGFloat = iconBackgroundWidth - (padding * 2) - 30
        
        addSubview(iconBackground)
        iconBackground.layer.cornerRadius = iconBackgroundWidth / 2
        iconBackground.anchor(top: topAnchor)
        iconBackground.centerX(inView: self)
        iconBackground.setDimensions(height: iconBackgroundWidth,
                                     width: iconBackgroundWidth)
        
        iconBackground.addSubview(iconView)
        iconView.setDimensions(height: iconWidth, width: iconWidth)
        iconView.anchor(top: iconBackground.topAnchor,
                        left: iconBackground.leftAnchor,
                        bottom: iconBackground.bottomAnchor,
                        right: iconBackground.rightAnchor,
                        paddingTop: padding,
                        paddingLeft: padding,
                        paddingBottom: padding,
                        paddingRight: padding)
        
        addSubview(categoryLabel)
        categoryLabel.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    // MARK: - helper
    
    func configureUI() {
        iconView.image = viewModel?.image
        categoryLabel.text = viewModel?.text
    }
}
