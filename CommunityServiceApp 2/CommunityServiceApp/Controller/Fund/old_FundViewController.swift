//
//  VisionView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/17.
//

import UIKit

class old_FundViewController: UIViewController {
    
    // MARK: - property
    
    private let communityIdentifier = "projectIdentifier"
    private let categoryIdentifier = "categoryIdentifier"
    
    private let padding: CGFloat = 20
    
    private lazy var customSwitch: CustomSwitchView = {
        let switchButton = CustomSwitchView()
        switchButton.delegate = self
        return switchButton
    }()
    
    private let thumbView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
//        cv.register(FundCategorypageView.self, forCellWithReuseIdentifier: categoryIdentifier)
        cv.register(FundProjectPageView.self, forCellWithReuseIdentifier: communityIdentifier)
        return cv
    }()
    
     // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSwitchButton()
        
        view.addSubview(collectionView)
        collectionView.anchor(top: customSwitch.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor)
    }
    
    // MARK: - Helper
    
    func configureSwitchButton() {
        view.addSubview(customSwitch)
        customSwitch.anchor(top: view.topAnchor, paddingTop: 80)
        customSwitch.centerX(inView: view)
        customSwitch.setDimensions(height: 60, width: 210)
        
        customSwitch.addSubview(thumbView)
        thumbView.frame = CGRect(x: 5, y: 5, width: 100, height: 50)
        thumbView.layer.cornerRadius = 25
    }
}

// MARK: - UICollectionViewDataSource

extension old_FundViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let page = indexPath.item
        
        if page == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryIdentifier, for: indexPath) as! FundCategorypageView
//            cell.delegate = self
//            return cell
            
            return UICollectionViewCell()
            
        } else if page == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: communityIdentifier, for: indexPath) as! FundProjectPageView
            cell.setupCollectionView(isProject: true)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension old_FundViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - padding)
    }
}

// MARK: - CustomSwitchViewDelegate

extension old_FundViewController: CustomSwitchViewDelegate {
    
    func didTapCategory(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1) {
            self.thumbView.frame.origin.x = self.customSwitch.frame.width / 2 - 100
            self.customSwitch.changeButtonColor(sender)
        }
        
        let page: IndexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: page, at: .centeredHorizontally, animated: true)
    }
    
    func didTapProject(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1) {
            self.thumbView.frame.origin.x = self.customSwitch.frame.width / 2
            self.customSwitch.changeButtonColor(sender)
        }
        
        let page: IndexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: page, at: .right, animated: true)
    }
}

// MARK: - FundCategoryViewDelegate

//extension old_FundViewController: FundCategoryViewDelegate {
//    func didTapCategory(model: FundCategoryModel) {
//        let controller = FundCategoryViewController(nibName: nil, bundle: nil, comCategoryModel: model)
//        navigationController?.pushViewController(controller, animated: true)
//    }
//}
