//
//  ProjectCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/02.
//

import UIKit

class MemberCell: UITableViewCell {
    
    // MARK: - property
    
    var viewModel: FundMemberViewModel? {
        didSet { configureUI() }
    }
    
    private let iconRadius: CGFloat = 50
    private let tailSize: CGFloat = 20
    private let padding: CGFloat = 10
    
    private let iconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    private let messageBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.numberOfLines = 0
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backgroundColor
        
        addSubview(iconView)
        iconView.setDimensions(height: iconRadius, width: iconRadius)
        iconView.layer.cornerRadius = iconRadius / 2
        iconView.anchor(left: leftAnchor,
                        bottom: bottomAnchor,
                        paddingLeft: padding,
                        paddingBottom: padding)
        
        addSubview(messageBaseView)
        messageBaseView.anchor(top: topAnchor,
                               left: iconView.rightAnchor,
                               bottom: bottomAnchor,
                               right: rightAnchor,
                               paddingLeft: tailSize,
                               paddingBottom: padding,
                               paddingRight: padding)
        
        messageBaseView.addSubview(messageLabel)
        messageLabel.anchor(top: messageBaseView.topAnchor,
                            left: messageBaseView.leftAnchor,
                            bottom: messageBaseView.bottomAnchor,
                            right: messageBaseView.rightAnchor,
                            paddingTop: padding,
                            paddingLeft: padding,
                            paddingBottom: padding,
                            paddingRight: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let tailView = LeftTailView(frame: CGRect(x: iconRadius + padding,
                                                  y: frame.height - tailSize - padding - 15,
                                                  width: tailSize, height: tailSize))
        tailView.backgroundColor = .clear
        addSubview(tailView)
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        iconView.image = viewModel.icon
        messageLabel.text = viewModel.message
    }
}
