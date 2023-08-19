//
//  FundProjectCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/14.
//

import UIKit

class FundProjectCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var viewModel: FundCellViewModel? {
        didSet { configureUI() }
    }
    
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
    
    private let supplierIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    private let visionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .titleTextColor
        label.font = .zenKakuMedium(size: 20)
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 15)
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.adjustLineSpace()
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .zenKakuBold(size: 14)
        label.backgroundColor = .init(white: 0.3, alpha: 0.5)
        return label
    }()
    
    private let activityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
//        label.backgroundColor = .earthYellow
        label.font = .zenKakuMedium(size: 15)
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.borderWidth = 0.5
        return label
    }()
    
    private let bottomBar: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemGray
        iv.setHeight(0.5)
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 8
        
        let padding: CGFloat = 10
        
        addSubview(visionLabel)
        visionLabel.setHeight(50)
        visionLabel.anchor(top: topAnchor,
                           left: leftAnchor,
                           right: rightAnchor)
        
        addSubview(imageView)
        imageView.setWidth(105)
        imageView.anchor(top: visionLabel.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         paddingLeft: padding,
                         paddingBottom: 15)
        
        addSubview(categoryLabel)
        categoryLabel.setHeight(20)
        categoryLabel.anchor(top: imageView.topAnchor,
                             left: imageView.leftAnchor)
        
        addSubview(activityLabel)
        activityLabel.setHeight(24)
        activityLabel.layer.cornerRadius = 12
        activityLabel.anchor(top: imageView.topAnchor,
                             left: imageView.rightAnchor,
                             paddingLeft: padding)
        
        addSubview(messageLabel)
        messageLabel.anchor(top: activityLabel.bottomAnchor,
                            left: activityLabel.leftAnchor,
                            right: rightAnchor,
                            paddingTop: 8, paddingRight: padding)
        
        addSubview(supplierLabel)
        supplierLabel.anchor(bottom: bottomAnchor,
                             right: messageLabel.rightAnchor)

        addSubview(supplierIcon)
        supplierIcon.setDimensions(height: 30, width: 30)
        supplierIcon.anchor(bottom: imageView.bottomAnchor,
                            right: supplierLabel.leftAnchor,
                            paddingRight: padding)

        supplierLabel.centerY(inView: supplierIcon)

//        addSubview(bottomBar)
//        bottomBar.anchor(left: imageView.leftAnchor,
//                         bottom: bottomAnchor,
//                         right: supplierLabel.rightAnchor)
//        bottomBar.setHeight(1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageLabel.sizeToFit()
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        visionLabel.text = viewModel.vision
        messageLabel.text = viewModel.message
        categoryLabel.text = viewModel.category
        activityLabel.text = viewModel.activity
        
        let categoryWidth = categoryLabel.getCellWidth(category: viewModel.category, size: 14)
        categoryLabel.setWidth(categoryWidth)

        let activityWidth = activityLabel.getCellWidth(category: viewModel.activity, size: 16) + 10
        activityLabel.setWidth(activityWidth)
    }
}
