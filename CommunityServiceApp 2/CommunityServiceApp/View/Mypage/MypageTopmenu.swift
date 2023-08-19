//
//  MypageTopmenu.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/08/01.
//

import UIKit

class MypageTopMenuCell: UICollectionViewCell {
    
    // MARK: - property
    
    var viewModel: TopMenuViewModel? {
        didSet { configureUI() }
    }
    
    private let iconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .zenKakuMedium(size: 14)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
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
        
        let iconSize: CGFloat = 28
        let padding: CGFloat = 10
        
        addSubview(categoryLabel)
        categoryLabel.centerY(inView: self)
        categoryLabel.anchor(left: leftAnchor,
                             right: rightAnchor,
                             paddingLeft: iconSize + padding + 3,
                             paddingRight: padding)

        addSubview(iconView)
        iconView.centerY(inView: categoryLabel)
        iconView.anchor(right: categoryLabel.leftAnchor, paddingRight: 3)
        iconView.setDimensions(height: iconSize, width: iconSize)
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        iconView.image = viewModel.image
        categoryLabel.text = viewModel.text
        categoryLabel.textColor = viewModel.textColor
    }
}
