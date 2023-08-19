//
//  SelectCategoryView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/13.
//

import UIKit

protocol SearchCategoryViewDelegate {
    func updateSearchCategory(indexPath: IndexPath)
}

class SearchCategoryView: UIView {
    
    // MARK: - Property
    
    private let identifier = "identifier"
    private var categories: [String] = []
    var delegate: SearchCategoryViewDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(SearchCategoryCell.self, forCellWithReuseIdentifier: identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private var defaultUnderBar: DefaultUnderBar?
    
    // MARK: - lifecycle
    
    init(frame: CGRect, categories: [String]) {
        self.categories = categories
        
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCtegory(indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

// MARK: - UICollectionViewDataSource

extension SearchCategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SearchCategoryCell
        cell.viewModel = SearchCategoryCellViewModel(category: categories[indexPath.row], num: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SearchCategoryView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item != 0 {
            let firstIndexPath = IndexPath(item: 0, section: indexPath.section)
            if let firstCell = collectionView.cellForItem(at: firstIndexPath) as? SearchCategoryCell {
                firstCell.updateUI()
            }
        }
        delegate?.updateSearchCategory(indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchCategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = getCategoryWidth(category: categories[indexPath.row])
        return CGSize(width: width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UIScrollViewDelegate

extension SearchCategoryView: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
}
