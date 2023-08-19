//
//  FinanceCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

class FinanceCell: UICollectionViewCell {
    
    // MARK: - data
    
    var viewModel: FinanceCellViewModel? {
        didSet { configureUI() }
    }
    
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
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 16)
        label.textAlignment = .left
        label.text = "title"
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 14)
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var contentsLabel = createLabel(isContent: true)
    private lazy var applicantLabel = createLabel(isContent: false)
    private lazy var supportPriceLabel = createLabel(isContent: false)
    
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
        
        let padding: CGFloat = 10
        let sidePadding: CGFloat = 5
        let iconSize: CGFloat = 30
        
        addSubview(supplierIcon)
        supplierIcon.setDimensions(height: iconSize, width: iconSize)
        supplierIcon.anchor(top: topAnchor,
                            left: leftAnchor,
                            paddingTop: padding,
                            paddingLeft: padding)
        
        addSubview(supplierLabel)
        supplierLabel.centerY(inView: supplierIcon)
        supplierLabel.anchor(left: supplierIcon.rightAnchor,
                             paddingLeft: sidePadding)
        
        addSubview(typeLabel)
        typeLabel.anchor(top: supplierLabel.topAnchor,
                         right: rightAnchor,
                         paddingRight: padding)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: supplierLabel.bottomAnchor,
                          left: supplierIcon.leftAnchor,
                          right: rightAnchor,
                          paddingTop: padding)
        
//        addSubview(imageView)
//        imageView.setDimensions(height: imageViewSize - iconSize, width: imageViewSize)
//        imageView.anchor(top: supplierIcon.bottomAnchor,
//                         left: supplierIcon.leftAnchor,
//                         paddingTop: sidePadding)
        
        addSubview(contentsLabel)
        contentsLabel.anchor(top: titleLabel.bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             paddingTop: padding,
                             paddingLeft: padding,
                             paddingRight: padding)
        
        addSubview(applicantLabel)
        applicantLabel.anchor(top: contentsLabel.bottomAnchor,
                              left: contentsLabel.leftAnchor,
                              right: contentsLabel.rightAnchor,
                              paddingTop: 8)
        
        addSubview(supportPriceLabel)
        supportPriceLabel.anchor(top: applicantLabel.bottomAnchor,
                                 left: contentsLabel.leftAnchor,
                                 right: contentsLabel.rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        imageView.image = viewModel.image
        supplierIcon.image = viewModel.icon
        titleLabel.text = viewModel.title
        typeLabel.text = viewModel.type
        supplierLabel.text = viewModel.supplier
        contentsLabel.text = viewModel.content
        
        let boldTextAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.zenKakuBold(size: 14)]
        let textAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.zenKakuMedium(size: 14)]
        let applicantAttributes = NSMutableAttributedString(string: "対象者", attributes: boldTextAttributes)
        let applicantAttributes2 = NSMutableAttributedString(string: "：\(viewModel.applicant)", attributes: textAttributes)
        applicantAttributes.append(applicantAttributes2)
        applicantLabel.attributedText = applicantAttributes
        
        let supportPriceAttributes = NSMutableAttributedString(string: "内容　", attributes: boldTextAttributes)
        let supportPriceAttributes2 = NSMutableAttributedString(string: "：\(viewModel.supportPrice)", attributes: textAttributes)
        supportPriceAttributes.append(supportPriceAttributes2)
        supportPriceLabel.attributedText = supportPriceAttributes
        
        let width = getCellWidth(category: viewModel.type, size: 14)
        typeLabel.setDimensions(height: 26, width: width)
    }
    
    func createLabel(isContent: Bool) -> UILabel {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = isContent ? 2 : 1
        label.adjustLineSpace()
        label.font = .zenKakuMedium(size: 14)
        return label
    }
}

