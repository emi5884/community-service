//
//  TipsViewCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/28.
//

import UIKit

class TipsViewCell: UICollectionViewCell {
    
    // MARK: - property
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(view)
        view.anchor(top: topAnchor,
                    left: leftAnchor,
                    bottom: bottomAnchor,
                    right: rightAnchor,
                    paddingTop: 10,
                    paddingLeft: 10,
                    paddingBottom: 10,
                    paddingRight: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
