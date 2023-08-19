//
//  DefaultUnderBar.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

class DefaultUnderBar: UIView {
    
    var color: UIColor = .earthPink {
        didSet { bar.backgroundColor = color }
    }
    
    private let bar = UIView()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bar.backgroundColor = color
        bar.frame = frame
        bar.layer.cornerRadius = 2.5
        
        addSubview(bar)
        bar.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
