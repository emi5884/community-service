//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class SelfIntroProfileCell: UITableViewCell {

    // MARK: - Property

    var selfIntro: String? {
        didSet { content.text = selfIntro }
    }

    private var content: UITextView = {
        let tv = UITextView()
        tv.font = .systemFont(ofSize: 14, weight: .regular)
        tv.textColor = .white
        tv.backgroundColor = .darkGray
        tv.textContainerInset = .zero
        tv.textContainer.lineFragmentPadding = 0
        tv.textContainer.maximumNumberOfLines = 3
        tv.textContainer.lineBreakMode = .byTruncatingTail
        return tv
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

        addSubview(content)
        content.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                       paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        content.setHeight(50)
    }
}
