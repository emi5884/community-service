//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class StandardProfileCell: UITableViewCell {

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

    private var subTitle: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .titleTextColor
        return label
    }()

    private var period: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let content: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 15)
        label.textColor = .titleTextColor
        label.numberOfLines = 0
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
        let padding: CGFloat = 10
        
        addSubview(icon)
        icon.anchor(top: topAnchor,
                    left: leftAnchor,
                    paddingTop: 3,
                    paddingLeft: padding)
        icon.setDimensions(height: 40, width: 40)

        addSubview(title)
        title.anchor(top: icon.topAnchor,
                     left: icon.rightAnchor,
                     right: rightAnchor,
                     paddingLeft: padding,
                     paddingRight: padding)

        addSubview(subTitle)
        subTitle.anchor(top: title.bottomAnchor,
                        left: title.leftAnchor,
                        right: rightAnchor,
                        paddingTop: 5,
                        paddingRight: padding)

        addSubview(period)
        period.anchor(top: subTitle.bottomAnchor,
                      left: title.leftAnchor,
                      right: rightAnchor,
                      paddingTop: 5,
                      paddingRight: padding)

        addSubview(content)
        content.anchor(top: period.bottomAnchor,
                       left: title.leftAnchor,
                       bottom: bottomAnchor,
                       right: rightAnchor,
                       paddingTop: 5,
                       paddingBottom: padding * 2 ,
                       paddingRight: padding)
    }

    func asignInfo() {
        guard let viewModel = viewModel else { return }
        icon.image = viewModel.icon
        title.text = viewModel.title
        subTitle.text = viewModel.subTitle
        period.text = viewModel.period
        content.text = viewModel.content
    }
}
