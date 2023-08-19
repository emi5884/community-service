//
//  AllPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/07.
//

import UIKit

class AllPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let spaces = [Space(image: #imageLiteral(resourceName: "dogrun2"), icon: #imageLiteral(resourceName: "park2_icon"), supplier: "蔵児市",
                                title: "武蔵川ドッグラン", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "dogrun1"), icon: #imageLiteral(resourceName: "park3_icon"), supplier: "公園協会",
                                title: "小金山ドッグラン", label: "Free"),
                          Space(image: #imageLiteral(resourceName: "dogrun3"), icon: #imageLiteral(resourceName: "park3_icon"), supplier: "公園協会",
                                title: "代々田ドッグラン", label: "Free")]
    
    private lazy var spaceModel: SpaceModel = SpaceModel(spaces: spaces)
    
    private let communs = [Community(image: #imageLiteral(resourceName: "dog"), icon: #imageLiteral(resourceName: "dog2_icon"), supplier: "社団法人ハッピードッグ",
                                     title: "保護犬から始まる世界平和を",
                                     description: "保健所から殺処分対象のワンコを引き出し、新しい家族に繋げています。",
                                     tags: ["保護犬", "アニマルシェルター"])]
    
    private lazy var communModel: CommunityModel = CommunityModel(communities: communs)
    
    private lazy var searchAll = SearchAll(itemModels: nil, foodModel: nil,
                                           eventModel: nil, spaceModel: spaceModel,
                                           learnModel: nil, communityModel: communModel,
                                           solutionModel: nil, recommendModel: nil)
    
    // MARK: - property
    
    private let headerIdentifier = "headerIdentifier"
    private let itemIdentifier = "itemIdentifier"
    private let foodIdentifier = "foodIdentifier"
    private let learnIdentifier = "learnIdentifier"
    private let communityIdentifier = "communityIdentifier"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(SmallCell.self, forCellWithReuseIdentifier: foodIdentifier)
        cv.register(LearnCell.self, forCellWithReuseIdentifier: learnIdentifier)
        cv.register(LongCell.self, forCellWithReuseIdentifier: communityIdentifier)
        cv.register(AllPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        cv.backgroundColor = .backgroundColor
        cv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return cv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension AllPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch SearchCategory(rawValue: section) {
        case .item:
            return searchAll.itemModel?.items.count ?? 0
        case .food:
            return searchAll.foodModel?.foods.count ?? 0
        case .space:
            return searchAll.spaceModel?.spaces.count ?? 0
        case .learn:
            return searchAll.learnModel?.learns.count ?? 0
        case .community:
            return searchAll.communityModel?.communities.count ?? 0
        case .event:
            return searchAll.eventModel?.events.count ?? 0
        
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch SearchCategory(rawValue: indexPath.section) {

        case .item:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodIdentifier, for: indexPath) as! SmallCell
            guard let item = searchAll.itemModel?.items[indexPath.row] else { return cell }
            cell.itemViewModel = ItemCellViewModel(cell: item)
            return cell
            
        case .food:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodIdentifier, for: indexPath) as! SmallCell
            guard let food = searchAll.foodModel?.foods[indexPath.row] else { return cell }
            cell.foodViewModel = FoodCellViewModel(cell: food)
            return cell
            
        case .space:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodIdentifier, for: indexPath) as! SmallCell
            guard let space = searchAll.spaceModel?.spaces[indexPath.row] else { return cell }
            cell.spaceViewModel = SpaceCellViewModel(cell: space)
            return cell

        case .learn:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: learnIdentifier, for: indexPath) as! LearnCell
            return cell

        case .community, .event:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: communityIdentifier, for: indexPath) as! LongCell
            guard let community = searchAll.communityModel?.communities[indexPath.row] else { return cell }
            cell.communityViewModel = CommunityCellViewModel(cell: community)
            cell.isCommunity = true
            return cell

        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: communityIdentifier, for: indexPath) as! LongCell
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searchAll.sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let head = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! AllPageHeader
        head.viewModel = SearchAllHeaderViewModel(searchAll: searchAll, section: indexPath.section)
        return head
    }
}

// MARK: - UICollectionViewDelegate

extension AllPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch SearchCategory(rawValue: indexPath.section) {
            
        case .item, .food, .space:
            let padding: CGFloat = 25
            let width = (frame.width - padding) / 3
            return CGSize(width: width, height: width + padding * 3 - 20)
            
        case .learn:
            let padding: CGFloat = 10
            return CGSize(width: (frame.width - padding) / 2, height: 305)
            
        case .event:
            let padding: CGFloat = 15
            return CGSize(width: frame.width - padding * 2, height: 120 + padding * 2)
            
        case .community:
            let padding: CGFloat = 10
            return CGSize(width: frame.width - padding * 2, height: 190)
            
        default:
            let padding: CGFloat = 10
            return CGSize(width: frame.width - padding * 2, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch SearchCategory(rawValue: section) {
        case .item, .food, .space:
            return 10
            
        case .learn, .community, .event:
            return 0
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch SearchCategory(rawValue: section) {
        case .item, .food, .space:
            return 2.5
            
        case .learn, .community, .event:
            return 0
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let zeroInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let tenInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        switch SearchCategory(rawValue: section) {
        
        case .item :
            if searchAll.itemModel == nil { return zeroInset }
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
        case .food :
            if searchAll.foodModel == nil { return zeroInset }
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
        case .space:
            if searchAll.spaceModel == nil { return zeroInset }
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            
        case .learn:
            if searchAll.learnModel == nil { return zeroInset }
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            
        case .community:
            if searchAll.communityModel == nil { return zeroInset }
            return tenInset
            
        case .event:
            if searchAll.eventModel == nil { return zeroInset }
            return tenInset
            
        default:
            return zeroInset
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let size = CGSize(width: frame.width, height: 40)
        
        switch SearchCategory(rawValue: section) {
        case .item:
            return searchAll.itemModel == nil ? CGSize.zero : size
        case .food:
            return searchAll.foodModel == nil  ? CGSize.zero : size
        case .space:
            return searchAll.spaceModel == nil  ? CGSize.zero : size
        case .learn:
            return searchAll.learnModel == nil  ? CGSize.zero : size
        case .community:
            return searchAll.communityModel == nil  ? CGSize.zero : size
        case .event:
            return searchAll.eventModel == nil  ? CGSize.zero : size
        
        default:
            return CGSize.zero
        }
    }
}
