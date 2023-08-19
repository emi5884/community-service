//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class SkillProfileCell: UITableViewCell {

    // MARK: - Properties
    
    var info: SkillInfo? {
        didSet {
            guard let info = info else { return }
            viewModel = SkillProfCellViewModel(info: info)
            asignInfo()
        }
    }
    
    private var viewModel: SkillProfCellViewModel?
    
    private var title: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 16)
        label.textColor = .titleTextColor
        return label
    }()
    
    private var refereeIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemBlue
        return iv
    }()
    
    private var referee: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 15)
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
        
        let padding: CGFloat = 10
        
        addSubview(title)
        title.anchor(top: topAnchor,
                     left: leftAnchor,
                     paddingTop: -3,
                     paddingLeft: padding)

        addSubview(refereeIcon)
        refereeIcon.setDimensions(height: 40, width: 40)
        refereeIcon.anchor(top: title.bottomAnchor,
                           left: leftAnchor,
                           bottom: bottomAnchor,
                           paddingTop: padding,
                           paddingLeft: padding,
                           paddingBottom: padding)

        addSubview(referee)
        referee.centerYAnchor.constraint(equalTo: refereeIcon.centerYAnchor).isActive = true
        referee.anchor(left: refereeIcon.rightAnchor,
                       right: rightAnchor,
                       paddingLeft: padding,
                       paddingRight: padding)
    }
    
    func asignInfo() {
        guard let viewModel = viewModel else { return }
        title.text = viewModel.title
        refereeIcon.image = viewModel.refereeIcon
        referee.text = viewModel.referee
    }
}
