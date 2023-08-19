//
//  CommunityButton.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/16.
//

import UIKit

class CommunityButton: UIView {
    
    // MARK: - Property
    private var isOpend = false
    
    private lazy var cityButton = createButton(color: .white,
                                               selector: #selector(didTapButton))
    private lazy var prefectureButton = createButton(color: .systemPurple,
                                                     selector: #selector(didTapButton))
    private lazy var japanButton = createButton(color: .systemOrange,
                                                selector: #selector(didTapButton))
    private lazy var worldButton = createButton(color: .systemPink,
                                                selector: #selector(didTapButton))
    
    private lazy var communityButtons = [worldButton, japanButton, prefectureButton, cityButton]
    private lazy var selectedCommunityButtons = [UIButton]()
    
    private var originalY: CGFloat = 0
    
    // MARK: - lifecycle
    
    init(frame: CGRect, originalY: CGFloat) {
        super.init(frame: frame)
        communityButtons.forEach { addSubview($0) }
        self.originalY = originalY
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    @objc func didTapButton(sender: UIButton) {
        
        if isOpend {
            selectedCommunityButtons = communityButtons.filter { $0 != sender }
            selectedCommunityButtons.append(sender)
            hideCommunityButtons(sender: sender)
            changeScale(isScaleup: false)
        } else {
            if selectedCommunityButtons == [] {
                selectedCommunityButtons = communityButtons
            }
            changeScale(isScaleup: true)
            showCommunityButtons()
        }
        
        isOpend = !isOpend
    }
    
    // MARK: - Helper
    
    private func createButton(color: UIColor, selector: Selector) -> UIButton {
        let button = UIButton.imageButton(image: #imageLiteral(resourceName: "map-pin-fill"), height: 50)
        button.setDimensions(height: 50, width: 50)
        button.layer.cornerRadius = 25
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 5
        button.backgroundColor = color
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }
    
    func showCommunityButtons() {
        selectedCommunityButtons.forEach { $0.alpha = 0 }
        
        UIView.animate(withDuration: 0.3) {
            self.selectedCommunityButtons[3].alpha = 1
        } completion: { _ in

            UIView.animate(withDuration: 0.1) {
                self.selectedCommunityButtons[2].alpha = 1
                self.selectedCommunityButtons[2].frame.origin.y = self.frame.height - 110
                self.selectedCommunityButtons[1].frame.origin.y = self.frame.height - 110
            } completion: { _ in

                UIView.animate(withDuration: 0.1) {
                    self.selectedCommunityButtons[1].alpha = 1
                    self.selectedCommunityButtons[1].frame.origin.y = self.frame.height - 170
                    self.selectedCommunityButtons[0].frame.origin.y = self.frame.height - 170
                } completion: { _ in
                    
                    UIView.animate(withDuration: 0.1) {
                        self.selectedCommunityButtons[0].alpha = 1
                        self.selectedCommunityButtons[0].frame.origin.y = self.frame.height - 230
                        
                    } completion: { _ in
                        self.selectedCommunityButtons = []
                    }
                }
            }
        }
    }
    
    private func hideCommunityButtons(sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            
            self.selectedCommunityButtons.forEach { button in
                button.frame.origin.y = self.frame.height - 50
                if button != sender { button.alpha = 0 }
            }
            
        } completion: { _ in
            self.layoutIfNeeded()
        }
    }
    
    private func changeScale(isScaleup: Bool) {
        // self.frameを縮小
        var frame = frame
        let newY = isScaleup ? frame.origin.y - 180 : originalY
        frame.origin.y = newY
        frame.size.height = isScaleup ? 230 : 50
        self.frame = frame
        layoutIfNeeded()
        self.backgroundColor = .systemMint
        
        selectedCommunityButtons.forEach { button in
            var newButtonFrame = button.frame
            newButtonFrame.origin.y = self.frame.height - 50
            button.frame = newButtonFrame
            layoutIfNeeded()
        }
    }
}
