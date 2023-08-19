//
//  SupporterTitleCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/16.
//

import UIKit

class SupporterTitleCell: UITableViewCell {
    
    // MARK: - property
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "サポーター"
        label.font = .zenKakuBold(size: 22)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        titleLabel.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
