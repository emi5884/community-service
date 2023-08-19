//
//  CustomSwitchView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/25.
//

import UIKit

protocol CustomSwitchViewDelegate {
    func didTapCategory(_ sender: UIButton)
    func didTapProject(_ sender: UIButton)
}

class CustomSwitchView: UIView {
    
    // MARK: - Property
    
    var delegate: CustomSwitchViewDelegate?
    
    private let frameView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 0.8
        view.layer.borderColor = UIColor.systemGray.cgColor
        return view
    }()
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("category", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapCategory), for: .touchUpInside)
        return button
    }()
    
    private lazy var projectButton: UIButton = {
        let button = UIButton()
        button.setTitle("project", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(didTapProject), for: .touchUpInside)
        return button
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
        backgroundColor = .white
        layer.cornerRadius = frame.height / 2
        
        addSubview(frameView)
        frameView.fillSuperview()
        frameView.layer.cornerRadius = frame.height / 2
        
        addSubview(categoryButton)
        categoryButton.centerY(inView: frameView)
        categoryButton.anchor(left: leftAnchor, paddingLeft: 5)
        categoryButton.setDimensions(height: frame.height,
                                     width: (frame.width / 2) - 5)
        
        addSubview(projectButton)
        projectButton.centerY(inView: frameView)
        projectButton.anchor(right: rightAnchor, paddingRight: 5)
        projectButton.setDimensions(height: frame.height,
                                    width: (frame.width / 2) - 5)
    }
    
    // MARK: - Action
    
    func changeButtonColor(_ sender: UIButton) {
        
        if sender == projectButton {
            projectButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            projectButton.setTitleColor(.white, for: .normal)
            categoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            categoryButton.setTitleColor(.systemGray, for: .normal)
        } else {
            categoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            categoryButton.setTitleColor(.white, for: .normal)
            projectButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            projectButton.setTitleColor(.systemGray, for: .normal)
        }
    }
    
    @objc func didTapCategory(sender: UIButton) {
        delegate?.didTapCategory(sender)
    }
    
    @objc func didTapProject(sender: UIButton) {
        delegate?.didTapProject(sender)
    }
}
