//
//  UploadCategoryView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit

class ButtonsCategoryView: UIView {
    
    // MARK: - Property
    
    private let identifier = "identifier"
    private var category: [String] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(ButtonsCategoryCell.self, forCellWithReuseIdentifier: identifier)
        return cv
    }()
    
    // MARK: - lifecycle
    
    init(frame: CGRect, category: [String]) {
        self.category = category
        
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension ButtonsCategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ButtonsCategoryCell
        cell.category = category[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ButtonsCategoryView: UICollectionViewDelegate {

}
// MARK: - UICollectionViewDelegateFlowLayout

extension ButtonsCategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let content = category[indexPath.row] as NSString
        let attr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16)]
        let contentSize = content.size(withAttributes: attr)
        let width = contentSize.width + 30
        let appropriateWidth = max(100, width)
        return CGSize(width: appropriateWidth, height: collectionView.bounds.height)
    }
}
