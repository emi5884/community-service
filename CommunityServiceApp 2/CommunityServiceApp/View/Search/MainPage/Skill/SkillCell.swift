//
//  SkillPageViewCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/12.
//

import UIKit

class SkillCell: UITableViewCell {
    
    // MARK: - property
    
    var viewModel: SkillCellViewModel? {
        didSet { configureUI() }
    }
    
    private let icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        iv.layer.cornerRadius = 25
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
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 14)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 18)
        return label
    }()
    
    private let messageBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .titleTextColor
        label.backgroundColor = .white
        label.font = .zenKakuMedium(size: 13)
        label.numberOfLines = 0
        return label
    }()
    
    private let bottomBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.setHeight(0.5)
        return view
    }()
    
    private let infoBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .superLightBackgroundColor
        return view
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 13)
        label.numberOfLines = 0
        return label
    }()
    
    private let supplierIconSize: CGFloat = 30
    private let iconSize: CGFloat = 50
    private let tailSize: CGFloat = 20
    private let padding: CGFloat = 10
    private let infoLabelHeight: CGFloat = 80
    
    // MARK: - lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backgroundColor
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingTop: padding,
                          paddingLeft: padding,
                          paddingRight: padding)
        
        addSubview(infoBackground)
        infoBackground.setHeight(infoLabelHeight)
        infoBackground.anchor(left: leftAnchor,
                              bottom: bottomAnchor,
                              right: rightAnchor,
                              paddingLeft: padding,
                              paddingBottom: padding * 2,
                              paddingRight: padding)
        
        infoBackground.addSubview(infoLabel)
        infoLabel.anchor(top: infoBackground.topAnchor,
                         left: infoBackground.leftAnchor,
                         bottom: infoBackground.bottomAnchor,
                         right: infoBackground.rightAnchor,
                         paddingTop: padding * 2,
                         paddingLeft: padding,
                         paddingBottom: padding,
                         paddingRight: padding)
        
        addSubview(supplierLabel)
        supplierLabel.centerX(inView: self)
        supplierLabel.anchor(bottom: infoBackground.topAnchor,
                             paddingBottom: -padding)

        addSubview(supplierIcon)
        supplierIcon.centerY(inView: supplierLabel)
        supplierIcon.setDimensions(height: supplierIconSize,
                                   width: supplierIconSize)
        supplierIcon.anchor(right: supplierLabel.leftAnchor,
                            paddingRight: padding)
        
        addSubview(messageBackGround)
        messageBackGround.anchor(top: titleLabel.bottomAnchor,
                                 left: leftAnchor,
                                 bottom: infoLabel.topAnchor,
                                 right: rightAnchor,
                                 paddingTop: padding,
                                 paddingLeft: iconSize + tailSize + 5,
                                 paddingBottom: padding * 5,
                                 paddingRight: padding)

        messageBackGround.addSubview(messageLabel)
        messageLabel.anchor(top: messageBackGround.topAnchor,
                            left: messageBackGround.leftAnchor,
                            bottom: messageBackGround.bottomAnchor,
                            right: messageBackGround.rightAnchor,
                            paddingTop: padding,
                            paddingLeft: padding,
                            paddingBottom: padding,
                            paddingRight: padding)

        addSubview(icon)
        icon.setDimensions(height: iconSize, width: iconSize)
        
        icon.anchor(left: leftAnchor,
                    bottom: messageBackGround.bottomAnchor,
                    paddingLeft: padding,
                    paddingBottom: padding)
        
        addSubview(bottomBar)
        bottomBar.anchor(left: icon.leftAnchor,
                         bottom: bottomAnchor,
                         right: messageBackGround.rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let tailY = frame.height - tailSize - infoLabelHeight - padding * 6 - 10
        let tailView = LeftTailView(frame: CGRect(x: iconSize + padding,
                                                 y: tailY,
                                                 width: tailSize, height: tailSize))
        tailView.backgroundColor = .clear
        addSubview(tailView)
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        icon.image = viewModel.image
        supplierIcon.image = viewModel.icon
        supplierLabel.text = viewModel.supplier
        titleLabel.text = viewModel.title
        messageLabel.text = viewModel.message
        infoLabel.text = viewModel.description
    }
}
