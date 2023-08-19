//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class ProfileHeaderCell: UITableViewCell {

    // MARK: - Property

    var header: Header? {
        didSet {
            viewModel = ProfHeaderCellViewModel(header: header!)
            asignInfo()
        }
    }

    private var viewModel: ProfHeaderCellViewModel?

    private var background: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    private var icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.backgroundColor.cgColor
        return iv
    }()

    private var name: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 16)
        label.textColor = .titleTextColor
        label.textAlignment = .center
        return label
    }()

    private var membership: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .titleTextColor
        return label
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
        let iconSize: CGFloat = 90
        let padding: CGFloat = 10
        
        addSubview(background)
        background.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        background.setHeight(120)
        
        addSubview(icon)
        icon.anchor(top: background.bottomAnchor, left: leftAnchor, paddingTop: -40, paddingLeft: 20)
        icon.setDimensions(height: iconSize, width: iconSize)
        icon.layer.cornerRadius = iconSize / 2

        addSubview(name)
        name.anchor(top: icon.bottomAnchor,
                    left: icon.leftAnchor,
                    bottom: bottomAnchor,
                    right: icon.rightAnchor,
                    paddingTop: padding,
                    paddingBottom: padding)
        
//        addSubview(membership)
//        membership.anchor(top: name.bottomAnchor, left: icon.leftAnchor,
//                          bottom: bottomAnchor, paddingTop: padding, paddingBottom: padding)
    }

    func asignInfo() {
        guard let viewModel = viewModel else { return }
        background.image = viewModel.background
        icon.image = viewModel.icon
        name.text = viewModel.name
        membership.text = viewModel.membership
    }
}
