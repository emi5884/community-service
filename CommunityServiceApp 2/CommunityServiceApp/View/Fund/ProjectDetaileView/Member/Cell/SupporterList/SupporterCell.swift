//
//  SupporterCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/16.
//

import UIKit

class SupporterCell: UICollectionViewCell {
    
    // MARK: - property
    
    var iconImage: UIImage? {
        didSet { imageView.image = iconImage ?? nil }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.backgroundColor.cgColor
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.layer.cornerRadius = self.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
