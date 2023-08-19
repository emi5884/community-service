//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class ActivityProfileCell: UITableViewCell {

    // MARK: - Property

    var info: ActivityInfo? {
        didSet {
            viewModel = ActivityProfCellViewModel(info: info!)
            asignInfo()
        }
    }

    private var viewModel: ActivityProfCellViewModel?

    private var icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    private var content: UITextView = {
        let tv = UITextView()
        tv.font = .zenKakuMedium(size: 14)
        tv.textColor = .white
        tv.backgroundColor = .clear
        tv.textContainerInset = .zero
        tv.textContainer.lineFragmentPadding = 0
        tv.textContainer.maximumNumberOfLines = 2
        tv.textContainer.lineBreakMode = .byTruncatingTail
        return tv
    }()
    
    private let like: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers

    func configureUI() {
        addSubview(icon)
        icon.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10)
        icon.setDimensions(height: 40, width: 40)

        addSubview(content)
        content.anchor(top: icon.topAnchor, left: icon.rightAnchor, bottom: bottomAnchor, right: rightAnchor,                 paddingLeft: 10, paddingBottom: 40, paddingRight: 10)
        content.setHeight(50)
        
        addSubview(like)
        like.anchor(top: content.bottomAnchor, left: icon.leftAnchor,
                    paddingTop: 10)
    }

    func asignInfo() {
        guard let viewModel = viewModel else { return }
        icon.image = viewModel.icon
        content.text = viewModel.content
        like.text = viewModel.like
    }
}
