//
//  VIsionHeaderView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/17.
//

import UIKit

class FundCategoryHeader: UICollectionReusableView {
    
    // MARK: - property
    
    var viewModel: FundCategoryViewModel? {
        didSet { visionCategoryView.configureUI(viewModel: viewModel) }
    }
    
    private let visionCategoryView = FundCategoryBaseView()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(visionCategoryView)
        visionCategoryView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
