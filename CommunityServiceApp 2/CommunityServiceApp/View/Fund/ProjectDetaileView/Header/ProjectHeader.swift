//
//  ProjectHeader.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/15.
//

import UIKit

class ProjectHeaderView: UIView {
    
    // MARK: - property
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dog")
//        imageView.image = #imageLiteral(resourceName: "firework")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let darkView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0.4, alpha: 0.5)
        return view
    }()
    
    private let visionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .zenKakuBold(size: 24)
        label.text = "保護犬から始まる世界平和を"
//        label.text = "冬の花火で地域を盛り上げたい"
        label.textAlignment = .center
        return label
    }()
    
    private let userIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dog2_icon")
//        imageView.image = #imageLiteral(resourceName: "firework_icon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .zenKakuBold(size: 18)
        label.text = "社団法人ハッピードッグ"
//        label.text = "地域振興協会"
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionText: UITextView = {
        let tv = UITextView()
        tv.textColor = .darkGray
        tv.font = .systemFont(ofSize: 16)
        tv.text = "保健所から殺処分対象のワンコを引き出し、新しい家族につなげています。"
//        tv.text = "毎年クリスマスの夜空に花火を打ち上げています！"
        tv.textAlignment = .left
        tv.textContainer.lineFragmentPadding = 0
        return tv
    }()
    
    private lazy var topButtons = createButtons(images: [ #imageLiteral(resourceName: "send_white")])
    private lazy var snsButtons = createSnsButtons(images: [#imageLiteral(resourceName: "instagram-logo-thin"), #imageLiteral(resourceName: "twitter-logo-thin")])
    
    private let signatureSize: CGFloat = 45
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let paddingTop: CGFloat = 13
        let paddingSide: CGFloat = 25
        let iconSize: CGFloat = 80
        
        addSubview(imageView)
        imageView.setHeight(170)
        imageView.anchor(top: topAnchor,
                         left: leftAnchor,
                         right: rightAnchor)
        
        imageView.addSubview(visionLabel)
        visionLabel.fillSuperview()
        
        imageView.addSubview(topButtons)
        topButtons.setDimensions(height: signatureSize, width: signatureSize)
        topButtons.anchor(bottom: imageView.bottomAnchor,
                          right: rightAnchor,
                          paddingBottom: paddingTop,
                          paddingRight: paddingTop)
        
        addSubview(userIcon)
        userIcon.setDimensions(height: iconSize, width: iconSize)
        userIcon.layer.cornerRadius = iconSize / 2
        userIcon.anchor(top: imageView.bottomAnchor,
                        left: leftAnchor,
                        paddingTop: -iconSize/2,
                        paddingLeft: paddingSide)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: userIcon.bottomAnchor,
                         left: userIcon.leftAnchor,
                         paddingTop: paddingTop)
        
        addSubview(descriptionText)
        descriptionText.anchor(top: nameLabel.bottomAnchor,
                               left: userIcon.leftAnchor,
                               bottom: bottomAnchor,
                               right: rightAnchor,
                               paddingRight: paddingSide)
        
        addSubview(snsButtons)
        snsButtons.setDimensions(height: 32, width: 80)
        snsButtons.anchor(top: imageView.bottomAnchor,
                          right: rightAnchor,
                          paddingTop: paddingTop,
                          paddingRight: paddingSide)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func createSnsButtons(images: [UIImage]) -> UIStackView {
        let buttons = images.map { image in
            let button = UIButton()
            button.setImage(image, for: .normal)
            return button
        }
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        
        return stack
    }
    
    func createButtons(images: [UIImage]) -> UIStackView {
        let buttons = images.map { image in
            let button = UIButton.imageButton(image: image, height: signatureSize)
            button.backgroundColor = .init(white: 0.2, alpha: 0.5)
            return button
        }
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        
        return stack
    }
}
