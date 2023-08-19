//
//  AllPageHeader.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

class AllPageHeader: UICollectionReusableView {
    
    // MARK: - property
    
    var viewModel: SearchAllHeaderViewModel? {
        didSet { categoryLabel.text = viewModel?.title }
    }
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 24)
        label.textColor = .titleTextColor
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(categoryLabel)
        categoryLabel.centerY(inView: self)
        categoryLabel.anchor(left: leftAnchor, paddingLeft: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
