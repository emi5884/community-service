//
//  ViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit
import PhotosUI

class MainTabBarController: UITabBarController {
    
    // MARK: - Property
    
    lazy var supportButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "support2"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var fundButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "fund_text2"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "share_text_long_2"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        configureButtons()
    }
    
    // MARK: - helper
    
    func configureUI() {
        delegate = self
        let home = templateViewController(image: #imageLiteral(resourceName: "every-user"), controller: CommunityViewController())
        let search = templateViewController(image: #imageLiteral(resourceName: "transpaernt"), controller: SearchViewController())
        let support = templateViewController(image: #imageLiteral(resourceName: "transpaernt"), controller: SupportViewController())
        let fund = templateViewController(image: #imageLiteral(resourceName: "transpaernt"), controller: FundViewController())
        let profile = templateViewController(image: #imageLiteral(resourceName: "user"), controller: ProfileViewController())
        
        viewControllers = [home, search, support, fund, profile]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    func templateViewController(image: UIImage, controller: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.tintColor = .black
        
        nav.tabBarItem.selectedImage = image
        nav.tabBarItem.image = image
        nav.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return nav
    }
    
    func configureButtons() {
        view.addSubview(supportButton)
        let iconHeight: CGFloat = 50
        
        view.addSubview(shareButton)
        shareButton.setDimensions(height: 28, width: 64)
        shareButton.anchor(left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           paddingLeft: 83,
                           paddingBottom: 35)
        
        view.addSubview(supportButton)
        supportButton.setDimensions(height: iconHeight, width: iconHeight)
        supportButton.anchor(bottom: view.bottomAnchor, paddingBottom: 25)
        supportButton.centerX(inView: view)
        
        view.addSubview(fundButton)
        fundButton.setDimensions(height: 28, width: 64)
        fundButton.anchor(left: supportButton.rightAnchor,
                          bottom: view.bottomAnchor,
                          paddingLeft: 30,
                          paddingBottom: 35)
    }
    
    // MARK: - action
    
    @objc func didTapButton(sender: UIButton) {
        
        if selectedIndex != 1 && sender == shareButton {
            selectedIndex = 1
            shareButton.setImage(#imageLiteral(resourceName: "share_text_long"), for: .normal)
            fundButton.setImage(#imageLiteral(resourceName: "fund_text2"), for: .normal)
            supportButton.setImage(#imageLiteral(resourceName: "support2"), for: .normal)
            
        } else if selectedIndex != 2 && sender == supportButton {
            selectedIndex = 2
            shareButton.setImage(#imageLiteral(resourceName: "share_text_long_2"), for: .normal)
            supportButton.setImage(#imageLiteral(resourceName: "support"), for: .normal)
            fundButton.setImage(#imageLiteral(resourceName: "fund_text2"), for: .normal)
            
        } else if selectedIndex != 3 && sender == fundButton {
            selectedIndex = 3
            shareButton.setImage(#imageLiteral(resourceName: "share_text_long_2"), for: .normal)
            fundButton.setImage(#imageLiteral(resourceName: "fund_text"), for: .normal)
            supportButton.setImage(#imageLiteral(resourceName: "support2"), for: .normal)
            
        }
    }
}

// MARK: - MainTabBarController

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        
        if index != 1 {
            shareButton.setImage(#imageLiteral(resourceName: "share_text_long_2"), for: .normal)
        }

        if index != 2 {
            supportButton.setImage(#imageLiteral(resourceName: "support2"), for: .normal)
        }
        
        if index != 3 {
            fundButton.setImage(#imageLiteral(resourceName: "fund_text2"), for: .normal)
        }

        return true
    }
}

//extension MainTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        let index = viewControllers?.firstIndex(of: viewController)
//
//        if index == 2 {
//            var config = PHPickerConfiguration()
//            config.selectionLimit = 10
//            let phPicker = PHPickerViewController(configuration: config)
//            phPicker.modalPresentationStyle = .fullScreen
//            phPicker.delegate = self
//            present(phPicker, animated: true)
//        }
//
//        return true
//    }
//}

// MARK: - UIImagePickerControllerDelegate

extension MainTabBarController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        var selectedImages: [UIImage] = []
        let dispatchGroup = DispatchGroup()
        // results内の各PHAsset(フォトライブラリ内の写真やビデオを表すクラス)からUIImageを非同期にロード
        for result in results {
            dispatchGroup.enter()
            
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let image = object as? UIImage {
                    selectedImages.append(image)
                } else {
                    print("Invalid data received")
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.dismiss(animated: false)

//            let upload = UploadController(selectedImages: selectedImages)
//            let nav = UINavigationController(rootViewController: upload)
//            nav.modalPresentationStyle = .fullScreen
//            self.present(nav, animated: false)
        }
    }
}
