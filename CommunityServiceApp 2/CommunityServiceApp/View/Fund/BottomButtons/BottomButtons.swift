//
//  BottomButtons.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/25.
//

import UIKit

class BottomButtons: UIView {
    
    // MARK: - Property
    
    private lazy var supportButton = createButton(image: #imageLiteral(resourceName: "like_selected"))
    private lazy var shareButton = createButton(image: #imageLiteral(resourceName: "send2"))
    private lazy var cocreationButton = createButton(image: #imageLiteral(resourceName: "search_unselected"))
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [supportButton, shareButton, cocreationButton])
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingBottom: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    func createButton(image: UIImage) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }
    
    // MARK: - Helper
    
    @objc func didTapButton() {
        
    }
}
