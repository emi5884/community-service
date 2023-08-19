//
//  LearnHeaderCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/01.
//

import UIKit

class LearnHeaderCell: UICollectionViewCell {
    
    // MARK: - property
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Mt.Fuji")
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.centerX(inView: self)
        imageView.centerY(inView: self)
        imageView.setDimensions(height: frame.height - 40,
                                width: frame.width - 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
