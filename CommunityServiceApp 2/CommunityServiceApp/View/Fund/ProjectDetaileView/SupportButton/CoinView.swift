//
//  CoinView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/22.
//

import UIKit

class CoinView: UIView {
    
    // MARK: - property
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .earthYellow
        return view
    }()
    
    private let coinImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "currency-jpy-thin")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(baseView)
        baseView.fillSuperview()
        
        baseView.addSubview(coinImageView)
        coinImageView.setDimensions(height: 30, width: 30)
        coinImageView.centerX(inView: baseView)
        coinImageView.centerY(inView: baseView)
    }
}
