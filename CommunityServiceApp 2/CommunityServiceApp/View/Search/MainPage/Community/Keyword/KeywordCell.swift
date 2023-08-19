//
//  KeywordCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class KeywordCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var tagText: String? {
        didSet { configureUI() }
    }
    
    private let keywordLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .zenKakuMedium(size: 12)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.borderWidth = 0.5
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(keywordLabel)
        keywordLabel.fillSuperview()
        keywordLabel.layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let text = tagText else { return }
        keywordLabel.text = text
        
        let width = keywordLabel.getCellWidth(category: text, size: 16)
        keywordLabel.setWidth(width)
    }
}
