//
//  ProfileView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

class InterestProfileCell: UITableViewCell {

    // MARK: - Properties
    
    var info: InterestInfo? {
        didSet {
            viewModel = InterestProfCellViewModel(info: info!)
            asignInfo()
        }
    }
    
    private var viewModel: InterestProfCellViewModel?
    
    private var icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemBlue
        return iv
    }()
    
    private var name: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 16)
        label.textColor = .white
        return label
    }()
    
    private var follower: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
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
        icon.anchor(top: topAnchor, left: leftAnchor,
                    paddingTop: 10, paddingLeft: 10)
        icon.setDimensions(height: 40, width: 40)
        
        addSubview(name)
        name.anchor(top: topAnchor, left: icon.rightAnchor, paddingTop: 10, paddingLeft: 10)

        addSubview(follower)
        follower.anchor(top: name.bottomAnchor, left: icon.rightAnchor, bottom: bottomAnchor,
                        paddingTop: 10, paddingLeft: 10, paddingBottom: 10)
    }
    
    func asignInfo() {
        guard let viewModel = viewModel else { return }
        icon.image = viewModel.icon
        name.text = viewModel.name
        follower.text = viewModel.follower
    }
}
