//
//  PageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/13.
//

import UIKit

class PageView: UIView {
    
    // MARK: - Property
    
    private let identifier = "identifier"
    
    private var selectedImages: [UIImage] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(PageCell.self, forCellWithReuseIdentifier: identifier)
        cv.isPagingEnabled = true
        return cv
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = selectedImages.count
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .earthYellow
        pc.pageIndicatorTintColor = .earthPurpleBlue
        return pc
    }()
    
    // MARK: - lifecycle
    
    init(frame: CGRect, images: [UIImage]) {
        self.selectedImages = images
        
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor,
                              left: leftAnchor,
                              right: rightAnchor)
        collectionView.setHeight(200)
        
        addSubview(pageControl)
        pageControl.anchor(top: collectionView.bottomAnchor,
                           left: leftAnchor,
                           right: rightAnchor)
        pageControl.setHeight(10)
    }
}

// MARK: - UICollectionViewDataSource

extension PageView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PageCell
        cell.image = selectedImages[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PageView: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentPage = Int(scrollView.contentOffset.x / frame.width)
        pageControl.currentPage = currentPage
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PageView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
