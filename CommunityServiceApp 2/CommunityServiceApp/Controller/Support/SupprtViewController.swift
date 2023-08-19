//
//  Supprt.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/13.
//

import UIKit

class SupportViewController: UIViewController {
    
    // MARK: - data
    
    private let supporters = [ #imageLiteral(resourceName: "supporter30"), #imageLiteral(resourceName: "supporter38"), #imageLiteral(resourceName: "supporter34"), #imageLiteral(resourceName: "supporter39"), #imageLiteral(resourceName: "supporter32"), #imageLiteral(resourceName: "supporter4"), #imageLiteral(resourceName: "supporter12"), #imageLiteral(resourceName: "supporter35"), #imageLiteral(resourceName: "supporter9"), #imageLiteral(resourceName: "supporter25"), #imageLiteral(resourceName: "supporter31"), #imageLiteral(resourceName: "supporter22"),#imageLiteral(resourceName: "supporter36"), #imageLiteral(resourceName: "supporter40"), #imageLiteral(resourceName: "supporter11")]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let padding: CGFloat = 10
    
    private let topMessage: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .zenKakuBold(size: 26)
        label.text = "Thanks for your support !"
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .lightBackgroundColor
        cv.dataSource = self
        cv.delegate = self
        cv.register(SupportCell.self, forCellWithReuseIdentifier: identifier)
        cv.contentInset = UIEdgeInsets(top: padding * 2, left: padding, bottom: padding, right: padding)
        return cv
    }()
    
    private let supportButton: UIButton = {
        let button = UIButton()
        button.setTitle("寄付情報を登録する", for: .normal)
        button.setTitleColor(.earthRed, for: .normal)
        button.titleLabel?.font = .zenKakuBold(size: 18)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.earthRed.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 1
        return button
    }()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor,
                              left: view.leftAnchor,
                              bottom: view.bottomAnchor,
                              right: view.rightAnchor)
        
        view.addSubview(topMessage)
        topMessage.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: -38)
        
        view.addSubview(supportButton)
//        supportButton.setDimensions(height: 50, width: view.frame.width - 100)
//        supportButton.centerX(inView: view)
//        supportButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
//                             paddingBottom: 20)
        
        let buttonHeight: CGFloat = 50
        let buttonWidth: CGFloat = view.frame.width - 100
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0
        supportButton.frame = CGRect(x: (view.frame.width / 2) - buttonWidth / 2,
                                     y: view.frame.height - buttonHeight - tabBarHeight - 20,
                                     width: buttonWidth, height: buttonHeight)
    }
}

// MARK: - UICollectionViewDataSource

extension SupportViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return supporters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SupportCell
        cell.supporter = supporters[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SupportViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - padding * 4 ) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
