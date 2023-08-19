//
//  VisionViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/17.
//

import UIKit

enum ProjectPage: Int {
    case about = 0
    case member = 1
    case report = 2
    case wishlist = 3
}

class ProjectViewController: UIViewController {
    
    // MARK: - Property
    
    private var comCategoryModel: FundCategoryModel?
    
    private let storyIdentifier = "storyIdentifier"
    private let memberIdentifier = "memberIdentifier"
    private let reportIdentifier = "reportPageView"
    private let wishIdentifier = "wishIdentifier"
    
    private let padding: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.register(StoryPageCell.self, forCellWithReuseIdentifier: storyIdentifier)
        cv.register(MemberPageView.self, forCellWithReuseIdentifier: memberIdentifier)
        cv.register(ReportPageView.self, forCellWithReuseIdentifier: reportIdentifier)
        cv.register(WishListPageView.self, forCellWithReuseIdentifier: wishIdentifier)
//        cv.contentInset = UIEdgeInsets(top: 20, left: padding, bottom: padding, right: padding)
        return cv
    }()
    
    private let projectHeaderView = ProjectHeaderView()
    
    private lazy var selectCategoryView: SearchCategoryView = {
        let sv = SearchCategoryView(frame: .zero, categories: projectCategory)
        sv.delegate = self
        return sv
    }()
    
    private lazy var supportButton: SupportButton = {
        let view = SupportButton()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSupportButton))
        view.addGestureRecognizer(gesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let coinView: CoinView = {
        let view = CoinView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private let headerBottomBar: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemGray
        iv.setHeight(0.5)
        return iv
    }()
    
    private var curvedView = CurvedView(frame: .zero, startPoint: .zero, endPoint: .zero,
                                        vertex1: .zero, vertex2: .zero)
    
    // MARK: - lifecycle
    
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,
//                  comCategoryModel: ComCategoryModel) {
//        self.comCategoryModel = comCategoryModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .white
        
        view.addSubview(projectHeaderView)
        projectHeaderView.setHeight(300)
        projectHeaderView.anchor(top: view.topAnchor,
                                 left: view.leftAnchor,
                                 right: view.rightAnchor)
        
        view.addSubview(selectCategoryView)
        selectCategoryView.setHeight(50)
        selectCategoryView.anchor(top: projectHeaderView.bottomAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor)
        
        view.addSubview(headerBottomBar)
        headerBottomBar.anchor(left: view.leftAnchor,
                               bottom: selectCategoryView.bottomAnchor,
                               right: view.rightAnchor)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: selectCategoryView.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor)
        
        setupSupportButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        guard let mainTabVC = tabBarController as? MainTabBarController else { return }
        mainTabVC.supportButton.isHidden = true
        mainTabVC.fundButton.isHidden = true
        mainTabVC.shareButton.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        
        guard let mainTabVC = tabBarController as? MainTabBarController else { return }
        mainTabVC.supportButton.isHidden = false
        mainTabVC.fundButton.isHidden = false
        mainTabVC.shareButton.isHidden = false
    }
    
    // MARK: - ation
    
    @objc func didTapSupportButton() {
        addCurvedView()
        
        let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.delegate = self
        curvedView.animarion(coinView: coinView, fadeOut: fadeOutAnimation)
    }
    
    // MARK: - helper
    
    func addCurvedView() {
        let imageViewInHeaderHeight: CGFloat = 170
        let iconInHeaderHalfSize: CGFloat = 40
        let iconInHeaderX: CGFloat = 25
        
        let coinViewX = coinView.frame.origin.x + 25
        let startPoint = CGPoint(x: coinViewX, y: coinView.frame.origin.y)
        
        let endPoint = CGPoint(x: iconInHeaderX + iconInHeaderHalfSize, y: imageViewInHeaderHeight)
        
        let vertexPoint1: CGPoint = CGPoint(x: startPoint.x + 200, y: endPoint.y + 100)
        let vertexPoint2: CGPoint = CGPoint(x: endPoint.x + 100,
                                            y: endPoint.y - 180)
        
        curvedView = CurvedView(frame: .zero,
                                startPoint: startPoint,
                                endPoint: endPoint,
                                vertex1: vertexPoint1,
                                vertex2: vertexPoint2)
        
        view.addSubview(curvedView)
        curvedView.backgroundColor = .clear
        curvedView.fillSuperview()
    }
    
    func setupSupportButton() {
        view.addSubview(supportButton)
        
        let tabBarHeight: CGFloat = tabBarController?.tabBar.frame.height ?? 0
        supportButton.setHeight(tabBarHeight)
        supportButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        supportButton.backgroundColor = .white
        
        view.addSubview(coinView)
        coinView.setDimensions(height: 50, width: 50)
        coinView.anchor(top: supportButton.topAnchor,
                        left: supportButton.leftAnchor,
                        paddingTop: -20,
                        paddingLeft: 110)
    }
}

// MARK: - UICollectionViewDataSource

extension ProjectViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let category = ProjectPage(rawValue: indexPath.row) {
            switch category {
            case .about:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyIdentifier, for: indexPath) as! StoryPageCell
                return cell
                
            case .member:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: memberIdentifier, for: indexPath) as! MemberPageView
                return cell
                
            case .report:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reportIdentifier, for: indexPath) as! ReportPageView
                cell.backgroundColor = .systemMint
                return cell
                
            case .wishlist:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: wishIdentifier, for: indexPath) as! WishListPageView
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
//                                                                     withReuseIdentifier: headerIdentifier,
//                                                                     for: indexPath) as! ProjectDetaileHeader
//        return header
//    }
}

// MARK: - UICollectionViewDelegate

extension ProjectViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let projectViewController = Old_ProjectViewController()
//        navigationController?.pushViewController(projectViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProjectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 130)
//    }
}

// MARK: - SearchCategoryViewDelegate

extension ProjectViewController: SearchCategoryViewDelegate {
    func updateSearchCategory(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - CAAnimationDelegate

extension ProjectViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        coinView.removeFromSuperview()
        supportButton.didSupport()
    }
}
