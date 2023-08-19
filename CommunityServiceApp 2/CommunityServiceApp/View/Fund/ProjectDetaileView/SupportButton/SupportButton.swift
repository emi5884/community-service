//
//  SupportButton.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/18.
//

import UIKit

class SupportButton: UIView {
    
    // MARK: - property
    
    private let baseView: UIView = {
        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.borderWidth = 5
//        view.layer.borderColor = UIColor.earthPink.cgColor
        view.backgroundColor = .earthDarkBlue
        return view
    }()
    
    private let icon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "hold_white")
        return iv
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "サポートする"
        label.textColor = .white
        label.font = .zenKakuBold(size: 24)
        return label
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
        
        let padding: CGFloat = 80
        let iconSize: CGFloat = frame.height - 10
        
        addSubview(baseView)
        baseView.fillSuperview()
        
        addSubview(icon)
        icon.setDimensions(height: iconSize, width: iconSize)
        icon.anchor(left: leftAnchor,
                    bottom: baseView.bottomAnchor,
                    paddingLeft: padding)

        addSubview(textLabel)
        textLabel.centerY(inView: self)
        textLabel.anchor(right: rightAnchor,
                         paddingRight: padding)
    }
    
    // MARK: - helper
    
    func didSupport() {
        textLabel.text = "サポートしています"
        textLabel.textColor = .white
        baseView.backgroundColor = .earthDarkBlue
        icon.alpha = 0
    }
}
