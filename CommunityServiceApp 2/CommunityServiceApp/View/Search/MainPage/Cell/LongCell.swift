//
//  EventCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

class LongCell: UICollectionViewCell {
    
    // MARK: - data
    
    var eventViewModel: EventCellViewModel? {
        didSet { configureEventUI() }
    }
    
    var communityViewModel: CommunityCellViewModel? {
        didSet { configureCommunityUI() }
    }
    
    var isCommunity = false
    
    // MARK: - Property
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .zenKakuBold(size: 18)
        label.backgroundColor = .init(white: 0.5, alpha: 0.6)
        return label
    }()
    
    private let supplierIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    private let supplierLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 14)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 17)
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 14)
        label.numberOfLines = 3
        label.adjustLineSpace()
        return label
    }()
    
    private let bottomBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.setHeight(0.5)
        return view
    }()
    
    private let keywords = KeywordView()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = .white
        
        let topPadding: CGFloat = 10
        let sidePadding: CGFloat = 5
        let imageViewSize: CGFloat = 120
        let iconSize: CGFloat = 30
        
        addSubview(supplierIcon)
        supplierIcon.setDimensions(height: iconSize, width: iconSize)
        supplierIcon.anchor(top: topAnchor,
                            left: leftAnchor,
                            paddingTop: topPadding,
                            paddingLeft: topPadding)
        
        addSubview(supplierLabel)
        supplierLabel.centerY(inView: supplierIcon)
        supplierLabel.anchor(left: supplierIcon.rightAnchor,
                             paddingLeft: sidePadding)
        
        addSubview(imageView)
        imageView.setDimensions(height: imageViewSize - iconSize, width: imageViewSize)
        imageView.anchor(top: supplierIcon.bottomAnchor,
                         left: supplierIcon.leftAnchor,
                         paddingTop: sidePadding)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: supplierIcon.bottomAnchor,
                          left: imageView.rightAnchor,
                          right: rightAnchor,
                          paddingLeft: topPadding,
                          paddingRight: topPadding)
        
        addSubview(contentsLabel)
        contentsLabel.anchor(top: titleLabel.bottomAnchor,
                             left: titleLabel.leftAnchor,
                             right: rightAnchor, paddingTop: 5,
                             paddingRight: topPadding)
        
        if !isCommunity {
            addSubview(priceLabel)
            priceLabel.setHeight(20)
            priceLabel.anchor(top: imageView.topAnchor,
                              left: imageView.leftAnchor)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isCommunity {
            addSubview(keywords)
            keywords.setHeight(50)
            keywords.anchor(top: imageView.bottomAnchor,
                            left: leftAnchor,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            paddingLeft: 10,
                            paddingRight: 10)
        }
        
//        addSubview(bottomBar)
//        bottomBar.anchor(left: leftAnchor,
//                         bottom: bottomAnchor,
//                         right: rightAnchor)
    }
    
    // MARK: - helper
    
    func configureEventUI() {
        guard let viewModel = eventViewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        contentsLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        
        let width = priceLabel.getCellWidth(category: viewModel.price, size: 16)
        priceLabel.setWidth(width)
    }
    
    func configureCommunityUI() {
        guard let viewModel = communityViewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        contentsLabel.text = viewModel.description
        keywords.tags = viewModel.tags
    }
}
