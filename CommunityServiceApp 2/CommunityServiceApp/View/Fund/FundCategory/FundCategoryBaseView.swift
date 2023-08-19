//
//  VisionCategoryView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/02.
//

import UIKit

class FundCategoryBaseView: UIView {
    
    // MARK: - Property
    
    private let labelHeight: CGFloat = 30
    
//    private lazy var categoryLabel: UILabel = {
//        let label = UILabel()
//        label.font = .boldSystemFont(ofSize: 16)
//        label.textAlignment = .center
//        label.backgroundColor = .white
//        label.setHeight(labelHeight)
//        label.layer.cornerRadius = labelHeight / 2
//        label.layer.masksToBounds = true
//        return label
//    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let padding: CGFloat = 10
//        addSubview(categoryLabel)
//        categoryLabel.anchor(left: leftAnchor, paddingLeft: padding)
//        categoryLabel.centerY(inView: self,
//                              constant: -(labelHeight))
        
        addSubview(titleLabel)
        titleLabel.anchor(left: leftAnchor, right: rightAnchor)
        titleLabel.centerY(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        categoryLabel.setWidth(categoryLabel.frame.width + 25)
//    }
    
    // MARK: - helper
    
    func configureUI(viewModel: FundCategoryViewModel?) {
        guard let viewModel = viewModel else { return }
        
//        self.backgroundColor = viewModel.color
//        categoryLabel.text = viewModel.category
//        categoryLabel.textColor = viewModel.color
        titleLabel.text = viewModel.title
    }
}
