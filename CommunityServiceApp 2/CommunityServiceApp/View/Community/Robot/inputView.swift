//
//  inputView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/27.
//

import UIKit

class InputView: UIView {
    
    // MARK: - property
    
    private let textView: UITextView = {
        let tv = UITextView()
        tv.font = .zenKakuMedium(size: 16)
        tv.textColor = .titleTextColor
        tv.backgroundColor = .backgroundColor
        return tv
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "telegram-logo-thin"), for: .normal)
        return button
    }()
    
    private let placeholder: UILabel = {
        let label = UILabel()
        label.text = "Enter message..."
        label.font = .zenKakuMedium(size: 16)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        autoresizingMask = .flexibleHeight
        
        let textViewHeight: CGFloat = 40
        let padding: CGFloat = 10
        
        addSubview(sendButton)
        sendButton.setDimensions(height: textViewHeight, width: textViewHeight)
        sendButton.anchor(right: rightAnchor,
                          paddingRight: padding)
        
        addSubview(textView)
        textView.layer.cornerRadius = textViewHeight / 2
        textView.setHeight(textViewHeight)
        textView.anchor(top: topAnchor,
                        left: leftAnchor,
                        right: sendButton.leftAnchor,
                        paddingTop: padding,
                        paddingLeft: padding,
                        paddingRight: padding)
        
        sendButton.centerY(inView: textView)
        
        addSubview(placeholder)
        placeholder.centerY(inView: textView)
        placeholder.anchor(left: textView.leftAnchor,
                           paddingLeft: padding)
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    // MARK: - action
    
    @objc func handleTextInputChange() {
        let noText = textView.text.isEmpty
        placeholder.isHidden = noText ? false : true
    }
}
