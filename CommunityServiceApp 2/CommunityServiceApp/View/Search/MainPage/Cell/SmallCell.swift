//
//  VisionPageCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/17.
//

import UIKit

class SmallCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var itemViewModel: ItemCellViewModel? {
        didSet { configureItemCellUI() }
    }
    
    var foodViewModel: FoodCellViewModel? {
        didSet { configureFoodCellUI() }
    }
    
    var spaceViewModel: SpaceCellViewModel? {
        didSet { configureSpaceCellUI() }
    }

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        return iv
    }()
    
    private let supplierIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        iv.layer.cornerRadius = 15
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
        label.textAlignment = .left
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 13)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .zenKakuBold(size: 18)
        label.backgroundColor = .init(white: 0.5, alpha: 0.6)
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 5
        
        let padding: CGFloat = 7
        
        addSubview(imageView)
        imageView.setHeight(frame.width - 20)
        imageView.centerX(inView: self)
        imageView.anchor(top: topAnchor,
                         left: leftAnchor,
                         right: rightAnchor)
        
        addSubview(priceLabel)
        priceLabel.setHeight(20)
        priceLabel.anchor(top: imageView.topAnchor,
                          left: imageView.leftAnchor)
        
        addSubview(supplierIcon)
        supplierIcon.setDimensions(height: 30, width: 30)
        supplierIcon.anchor(top: imageView.bottomAnchor,
                            left: leftAnchor,
                            paddingTop: padding,
                            paddingLeft: padding)
        
        addSubview(supplierLabel)
        supplierLabel.centerY(inView: supplierIcon)
        supplierLabel.anchor(left: supplierIcon.rightAnchor,
                             right: rightAnchor,
                             paddingLeft: padding)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: supplierIcon.bottomAnchor,
                          left: supplierIcon.leftAnchor,
                          right: rightAnchor,
                          paddingTop: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let maskPath = UIBezierPath(roundedRect: imageView.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: 5, height: 5))

        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        imageView.layer.mask = maskLayer
    }
    
    // MARK: - helper
    
    func configureItemCellUI() {
        guard let viewModel = itemViewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        
        let width = priceLabel.getCellWidth(category: viewModel.price, size: 16)
        priceLabel.setWidth(width)
    }
    
    func configureFoodCellUI() {
        guard let viewModel = foodViewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        
        let width = priceLabel.getCellWidth(category: viewModel.price, size: 16)
        priceLabel.setWidth(width)
    }
    
    func configureSpaceCellUI() {
        guard let viewModel = spaceViewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        
        let width = priceLabel.getCellWidth(category: viewModel.price, size: 16)
        priceLabel.setWidth(width)
    }
}
