//
//  WishListCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/13.
//

import UIKit

class WishListCell: UITableViewCell {
    
    // MARK: - property
    
    var viewModel: FundWishViewModel? {
        didSet { configureUI() }
    }
    
    private let checkMark: UILabel = {
        let label = UILabel()
        label.text = "□"
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 16)
        label.textColor = .titleTextColor
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let paddingSide: CGFloat = 20
        let padding: CGFloat = 10
        
        addSubview(checkMark)
        checkMark.setDimensions(height: 20, width: 20)
        checkMark.anchor(top: topAnchor,
                         left: leftAnchor,
                         paddingTop: padding,
                         paddingLeft: paddingSide)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: checkMark.topAnchor,
                          left: checkMark.rightAnchor,
                          paddingTop: -3,
                          paddingLeft: padding)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor,
                                left: titleLabel.leftAnchor,
                                bottom: bottomAnchor,
                                right: rightAnchor,
                                paddingTop: 5,
                                paddingBottom: padding,
                                paddingRight: paddingSide)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
