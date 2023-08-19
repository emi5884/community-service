//
//  FundCategoryView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/14.
//

import UIKit
import DGCharts

class FundViewController: UIViewController {
    
    // MARK: - data
    
    private let values: [Int] = []
    
    private lazy var entries = [PieChartDataEntry(value: FundChartValue.kids.doubleValue,
                                                  label: FundCategory.kids.rawValue),
                                PieChartDataEntry(value: FundChartValue.society.doubleValue,
                                                  label: FundCategory.society.rawValue),
                                PieChartDataEntry(value: FundChartValue.animal.doubleValue,
                                                  label: FundCategory.animal.rawValue),
                                PieChartDataEntry(value: FundChartValue.environment.doubleValue,
                                                  label: FundCategory.environment.rawValue),
                                PieChartDataEntry(value: FundChartValue.peace.doubleValue,
                                                  label: FundCategory.peace.rawValue),
                                PieChartDataEntry(value: FundChartValue.health.doubleValue,
                                                  label: FundCategory.health.rawValue),
                                PieChartDataEntry(value: FundChartValue.city.doubleValue,
                                                  label: FundCategory.city.rawValue),
                                PieChartDataEntry(value: FundChartValue.education.doubleValue,
                                                  label: FundCategory.education.rawValue),
                                PieChartDataEntry(value: FundChartValue.culture.doubleValue,
                                                  label: FundCategory.culture.rawValue)]
    
    private let kids = FundCategory.kids
    private let animal = FundCategory.animal
    private let peace = FundCategory.peace
    private let environment = FundCategory.environment
    private let health = FundCategory.health
    private let city = FundCategory.city
    private let education = FundCategory.education
    private let culture = FundCategory.culture
    private let society = FundCategory.society
    private let all = FundCategory.all

    private lazy var categories: [FundCategory] = [kids, society, animal, environment,
                                                   health, city, education,
                                                   culture, peace, all]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let headerIdentifier = "headerIdentifier"
    private let padding: CGFloat = 20
    
    private var isProject = false
    
    private let titleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "fund_text_big")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .lightBackgroundColor
        cv.delegate = self
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0)
        cv.register(FundCategoryPageCell.self, forCellWithReuseIdentifier: identifier)
        cv.register(FundHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: headerIdentifier)
        return cv
    }()
    
     // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        
        view.addSubview(titleImageView)
        titleImageView.setHeight(50)
        titleImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: -30)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: titleImageView.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor, paddingTop: 20)
    }
}

// MARK: - UICollectionViewDataSource

extension FundViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FundCategoryPageCell
        cell.viewModel = FundCategoryViewModel(category: categories[indexPath.row], indexRow: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! FundHeaderView
        header.entryData = entries
        return header
    }
}

// MARK: - UICollectionViewDelegate

extension FundViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = FundCategoryViewController(nibName: nil,
                                                    bundle: nil,
                                                    fundCategory: categories[indexPath.row],
                                                    isAnimalFunds: indexPath.row + 1 != categories.count)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FundViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - padding * 2, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}
