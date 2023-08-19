//
//  LearnCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/01.
//

import UIKit

class LearnCell: UICollectionViewCell {
    
    // MARK: - property
    
    var viewModel: LearnCellViewModel? {
        didSet { configureUI() }
    }
    
    private var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 17)
        label.textColor = .titleTextColor
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
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 14)
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.borderWidth = 0.3
        label.layer.borderColor = UIColor.systemGray.cgColor
        return label
    }()
    
    private let textContentView: UIView = {
        let view = UIView()
        return view
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
        label.text = "supplier"
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 14)
        return label
    }()
    
    private let certificateIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "certificate-light")
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
        return iv
    }()
    
    private lazy var skillLabel1 = createSkillLabel()
    private lazy var skillLabel2 = createSkillLabel()
    private lazy var skillLabel3 = createSkillLabel()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let padding: CGFloat = 10
        
        addSubview(baseView)
        baseView.anchor(top: topAnchor,
                        left: leftAnchor,
                        bottom: bottomAnchor,
                        right: rightAnchor)
        
        baseView.addSubview(certificateIcon)
        certificateIcon.setDimensions(height: 25, width: 25)
        certificateIcon.anchor(top: baseView.topAnchor,
                               right: baseView.rightAnchor,
                               paddingTop: 4,
                               paddingRight: padding)
        
        baseView.addSubview(titleLabel)
        titleLabel.anchor(top: baseView.topAnchor,
                          left: baseView.leftAnchor,
                          right: certificateIcon.leftAnchor,
                          paddingTop: padding / 2, paddingLeft: padding)
        
        baseView.addSubview(imageView)
        imageView.setHeight(frame.height / 3)
        imageView.anchor(top: titleLabel.bottomAnchor,
                         left: baseView.leftAnchor,
                         right: baseView.rightAnchor,
                         paddingTop: padding / 2,
                         paddingLeft: padding,
                         paddingRight: padding)
        
        baseView.addSubview(priceLabel)
        priceLabel.anchor(top: imageView.topAnchor,
                          right: imageView.rightAnchor)
        
        baseView.addSubview(categoryLabel)
        categoryLabel.setHeight(20)
        categoryLabel.layer.cornerRadius = 10
        categoryLabel.anchor(left: imageView.leftAnchor,
                             bottom: imageView.bottomAnchor,
                             right: imageView.rightAnchor ,
                             paddingLeft: padding,
                             paddingBottom: -padding,
                             paddingRight: padding)
        
        baseView.addSubview(textContentView)
        textContentView.anchor(top: imageView.bottomAnchor,
                               left: imageView.leftAnchor,
                               bottom: baseView.bottomAnchor,
                               right: imageView.rightAnchor,
                               paddingTop: padding + 10,
                               paddingBottom: padding)
        
        textContentView.addSubview(skillLabel1)
        skillLabel1.anchor(top: textContentView.topAnchor,
                           left: imageView.leftAnchor,
                           right: imageView.rightAnchor)
        
        textContentView.addSubview(skillLabel2)
        skillLabel2.anchor(top: skillLabel1.bottomAnchor,
                           left: imageView.leftAnchor,
                           right: imageView.rightAnchor,
                           paddingTop: 3)
        
        textContentView.addSubview(skillLabel3)
        skillLabel3.anchor(top: skillLabel2.bottomAnchor,
                           left: imageView.leftAnchor,
                           right: imageView.rightAnchor,
                           paddingTop: 3)
        
        textContentView.addSubview(supplierIcon)
        supplierIcon.setDimensions(height: 30, width: 30)
        supplierIcon.anchor(left: textContentView.leftAnchor,
                            bottom: textContentView.bottomAnchor,
                            paddingLeft: 5,
                            paddingBottom: 5)
        
        textContentView.addSubview(supplierLabel)
        supplierLabel.centerY(inView: supplierIcon)
        supplierLabel.anchor(left: supplierIcon.rightAnchor,
                             right: rightAnchor, paddingLeft: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        skillLabel1.text = viewModel.skill1
        skillLabel2.text = viewModel.skill2
        skillLabel3.text = viewModel.skill3
        categoryLabel.text = viewModel.category
        priceLabel.text = viewModel.price
        
        let width = priceLabel.getCellWidth(category: viewModel.price, size: 16)
        priceLabel.setWidth(width)
        
        if viewModel.isCertificate {
            certificateIcon.isHidden = false
        }
    }
    
    func createSkillLabel() -> UILabel {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .titleTextColor
        return label
    }
}
