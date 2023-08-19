//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class AssistanceActivityProfileCell: UITableViewCell {
    
    // MARK: - Property

    var info: StandardInfo? {
        didSet {
            viewModel = StandardProfCellViewModel(info: info!)
            asignInfo()
        }
    }

    private var viewModel: StandardProfCellViewModel?

    private var icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    private var title: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 16)
        label.textColor = .titleTextColor
        return label
    }()

    private var content: UITextView = {
        let tv = UITextView()
        tv.font = .zenKakuMedium(size: 14)
        tv.textColor = .titleTextColor
        tv.backgroundColor = .clear
        tv.textContainerInset = .zero
        tv.textContainer.lineFragmentPadding = 0
        tv.textContainer.maximumNumberOfLines = 2
        tv.textContainer.lineBreakMode = .byTruncatingTail
        return tv
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers

    func configureUI() {
        
        let padding: CGFloat = 10
        
        addSubview(icon)
        icon.setDimensions(height: 40, width: 40)
        icon.anchor(top: topAnchor,
                    left: leftAnchor,
                    paddingTop: padding,
                    paddingLeft: padding)

        addSubview(title)
        title.anchor(top: icon.topAnchor,
                     left: icon.rightAnchor,
                     right: rightAnchor,
                     paddingLeft: padding,
                     paddingRight: padding)

        addSubview(content)
        content.anchor(top: title.bottomAnchor,
                       left: title.leftAnchor,
                       bottom: bottomAnchor,
                       right: rightAnchor,
                       paddingTop: 5,
                       paddingBottom: padding,
                       paddingRight: padding)
        content.setHeight(35)
    }

    func asignInfo() {
        guard let viewModel = viewModel else { return }
        
        icon.image = viewModel.icon
        title.text = viewModel.title
        content.text = viewModel.content
    }
}
