//
//  SearchViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Property
    
    private let allIdentifier = "allIdentifier"
    private let itemIdentifier = "itemIdentifier"
    private let foodIdentifier = "foodIdentifier"
    private let spaceIdentifier = "spaceIdentifier"
    private let eventIdentifier = "eventIdentifier"
    private let learnIdentifier = "learnIdentifier"
    private let comCellInSearchIdentifier = "comCellInSearchIdentifier"
    private let skillIdentifier = "skillIdentifier"
    private let financeIdentifier = "financeIdentifier"
    
    private lazy var selectCategoryView: SearchCategoryView = {
        let sv = SearchCategoryView(frame: .zero, categories: shareCategory)
        sv.delegate = self
        return sv
    }()
    
    private lazy var customSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search.."
        sb.showsCancelButton = true
        sb.delegate = self
        sb.searchTextField.backgroundColor = .lightBackgroundColor
        sb.searchTextField.font = .zenKakuMedium(size: 16)
        return sb
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(AllPageView.self, forCellWithReuseIdentifier: allIdentifier)
        cv.register(ItemPageView.self, forCellWithReuseIdentifier: itemIdentifier)
        cv.register(FoodPageView.self, forCellWithReuseIdentifier: foodIdentifier)
        cv.register(SpacePageView.self, forCellWithReuseIdentifier: spaceIdentifier)
        cv.register(EventPageView.self, forCellWithReuseIdentifier: eventIdentifier)
        cv.register(LearnPageView.self, forCellWithReuseIdentifier: learnIdentifier)
        cv.register(CommunityPageView.self, forCellWithReuseIdentifier: comCellInSearchIdentifier)
        cv.register(SkillPageView.self, forCellWithReuseIdentifier: skillIdentifier)
        cv.register(FinancePageView.self, forCellWithReuseIdentifier: financeIdentifier)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counfigureUI()
        configureCommunityButton()
    }
    
    // MARK: - Helper
    
    fileprivate func counfigureUI() {
        
        navigationItem.titleView = customSearchBar
        
        view.addSubview(selectCategoryView)
        selectCategoryView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor)
        selectCategoryView.setHeight(50)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: selectCategoryView.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: view.bottomAnchor,
                              right: view.rightAnchor)
    }
    
    func configureCommunityButton() {
        let buttonSize: CGFloat = 50
        let padding: CGFloat = 10
        
        let tabHeight = CGFloat(tabBarController?.tabBar.frame.height ?? 0)
        let buttonY = view.frame.height - (tabHeight + buttonSize + padding)
        let frame = CGRect(x: view.frame.width - (buttonSize + padding),
                           y: buttonY,
                           width: buttonSize, height: buttonSize)
        let communityButton = CommunityButton(frame: frame, originalY: buttonY)
        
        view.addSubview(communityButton)
    }
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shareCategory.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         if let category = SearchCategory(rawValue: indexPath.row) {
             switch category {
             case .all:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allIdentifier,
                                                               for: indexPath) as! AllPageView
                 return cell
             case .item:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier,
                                                               for: indexPath) as! ItemPageView
                 return cell
             case .food:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodIdentifier,
                                                               for: indexPath) as! FoodPageView
                 return cell
                 
             case .space:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: spaceIdentifier,
                                                               for: indexPath) as! SpacePageView
                 return cell
                 
             case .learn:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: learnIdentifier,
                                                               for: indexPath) as! LearnPageView
                 return cell
                 
             case .event:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventIdentifier,
                                                               for: indexPath) as! EventPageView
                 return cell
                 
             case .community:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comCellInSearchIdentifier, for: indexPath) as! CommunityPageView
                 cell.setupCollectionView(isProject: false)
                 return cell
                 
             case .skill:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: skillIdentifier, for: indexPath) as! SkillPageView
                 return cell
             case .finance:
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: financeIdentifier, for: indexPath) as! FinancePageView
                 return cell
             }
         }
         
         let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier,
                                                              for: indexPath) as! ItemPageView
         return defaultCell
    }
}

// MARK: - UICollectionViewDelegate

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UIScrollViewDelegate

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let item = Int(scrollView.contentOffset.x / view.frame.width)
        let indexPath = IndexPath(item: item, section: 0)
        selectCategoryView.updateCtegory(indexPath: indexPath)
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText: \(searchText)")
    }
}

// MARK: - SearchCategoryViewDelegate

extension SearchViewController: SearchCategoryViewDelegate {
    func updateSearchCategory(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
}

//// MARK: - SearchPageCellDelegate
//
//extension SearchViewController: SearchMainPageCellDelegate {
//    func showDetaileView(cell: UICollectionViewCell) {
//        let heroId = "heroId"
//        cell.hero.id = heroId
//
//        let upload = UploadController()
//        upload.modalPresentationStyle = .fullScreen
//        upload.isHeroEnabled = true
//        upload.pageView.hero.id = heroId
//        present(upload, animated: true)
//    }
//}
