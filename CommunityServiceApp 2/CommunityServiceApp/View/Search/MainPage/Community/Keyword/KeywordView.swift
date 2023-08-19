//
//  KeywordCollectionView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/21.
//

import UIKit

class KeywordView: UIView {
    
    // MARK: - Property
    
    var tags: [String] = [] {
        didSet { collectionView.reloadData() }
    }
    
    private let identifier = "identifier"
    
    private let tagIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "tag-thin")
        return iv
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(KeywordCell.self, forCellWithReuseIdentifier: identifier)
        return cv
    }()
    
    // MARK: - lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        collectionView.addSubview(tagIcon)
        tagIcon.setDimensions(height: 25, width: 25)
        tagIcon.anchor(left: leftAnchor)
        tagIcon.centerY(inView: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension KeywordView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! KeywordCell
        cell.tagText = tags[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension KeywordView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = getCellWidth(category: tags[indexPath.row], size: 16)
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
}

