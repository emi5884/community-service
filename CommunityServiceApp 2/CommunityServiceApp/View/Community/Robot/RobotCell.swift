//
//  RobotView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/25.
//

import UIKit

class RobotViewCell: UITableViewCell {
    
    // MARK: - property
    
    var viewModel: RobotViewModel? {
        didSet {configureUI() }
    }
    
    private let icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        return iv
    }()
    
    private let messageLabelBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .titleTextColor
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private let leftTail: LeftTailView = {
        let tail = LeftTailView()
        tail.backgroundColor = .clear
        return tail
    }()
    
    private let rightTail: RightTailView = {
        let tail = RightTailView()
        tail.backgroundColor = .clear
        return tail
    }()
    
    private let padding: CGFloat = 10
    private let tailSize: CGFloat = 15
    private let iconSize: CGFloat = 30
    
    // MARK: - lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        addSubview(messageLabel)
        messageLabel.anchor(top: messageLabelBackground.topAnchor,
                            left: messageLabelBackground.leftAnchor,
                            bottom: messageLabelBackground.bottomAnchor,
                            right: messageLabelBackground.rightAnchor,
                            paddingTop: padding,
                            paddingLeft: padding,
                            paddingBottom: padding,
                            paddingRight: padding)
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        messageLabel.text = viewModel.message
        icon.image = viewModel.image
        
        let messageWidth = getMessageWidth(message: viewModel.message)
        messageLabelBackground.setWidth(messageWidth)
        addSubview(messageLabelBackground)
    
        if viewModel.isSelf {
            configureRightMessage()
        } else {
            configureLeftMessage()
        }
    }
    
    func configureLeftMessage() {
        addSubview(icon)
        icon.setDimensions(height: iconSize, width: iconSize)
        icon.layer.cornerRadius = iconSize / 2
        icon.anchor(left: leftAnchor,
                    bottom: bottomAnchor,
                    paddingLeft: padding)
        
        messageLabelBackground.anchor(top: topAnchor,
                                      left: icon.rightAnchor,
                                      bottom: bottomAnchor,
                                      paddingTop: padding,
                                      paddingLeft: tailSize,
                                      paddingBottom: padding)
        
        addSubview(leftTail)
        leftTail.setDimensions(height: tailSize, width: tailSize)
        leftTail.anchor(bottom: messageLabelBackground.bottomAnchor,
                        right: messageLabelBackground.leftAnchor,
                        paddingBottom: padding)
    }
    
    func configureRightMessage() {
        
        addSubview(rightTail)
        rightTail.setDimensions(height: tailSize, width: tailSize)
        rightTail.anchor(bottom: messageLabelBackground.bottomAnchor,
                         right: rightAnchor,
                         paddingBottom: padding,
                         paddingRight: padding)
        
        messageLabelBackground.anchor(top: topAnchor,
                                      bottom: bottomAnchor,
                                      right: rightTail.leftAnchor,
                                      paddingTop: padding,
                                      paddingBottom: padding)
    }
    
    func getMessageWidth(message: String) -> CGFloat {
        let estimatedMessageWidth: CGFloat = getCellWidth(category: message, size: 14)
        let shortWidth = estimatedMessageWidth + padding * 2 + 5
        let longWidth = frame.width - iconSize - padding - tailSize - 50
        let messageWidth = estimatedMessageWidth < longWidth ? shortWidth : longWidth
        return messageWidth
    }
}
