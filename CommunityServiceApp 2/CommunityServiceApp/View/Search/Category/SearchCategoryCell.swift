//
//  SearchCategoryCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/13.
//

import UIKit

class SearchCategoryCell: UICollectionViewCell {
    
    // MARK: - property
    
    var viewModel: SearchCategoryCellViewModel? {
        didSet { configureUI() }
    }
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 16)
        label.textAlignment = .center
        return label
    }()
    
    let underBar: UIView = {
        let view = UIView()
        view.setHeight(5)
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            underBar.backgroundColor = isSelected ? .earthPink : .clear
            categoryLabel.textColor = isSelected ? .titleTextColor : .systemGray
        }
    }
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoryLabel)
        categoryLabel.fillSuperview()
        
        addSubview(underBar)
        underBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        categoryLabel.text = viewModel.category
        categoryLabel.textColor = viewModel.textColor
        underBar.backgroundColor = viewModel.barColor
    }
    
    func updateUI() {
        underBar.backgroundColor = .clear
        categoryLabel.textColor = .systemGray
    }
}
