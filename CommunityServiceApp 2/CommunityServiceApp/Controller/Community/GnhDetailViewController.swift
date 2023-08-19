//
//  gnhDetailViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/29.
//

import UIKit
import DGCharts

class GnhViewController: UIViewController {
    
    // MARK: - Data
    
    private lazy var social1 = [PieChartDataEntry(value: 70, label: GnhSocialQuestions.question1),
                                PieChartDataEntry(value: 30, label: "")]
    private lazy var social2 = [PieChartDataEntry(value: 75, label: GnhSocialQuestions.question2),
                                PieChartDataEntry(value: 35, label: "")]
    private lazy var social3 = [PieChartDataEntry(value: 80, label: GnhSocialQuestions.question3),
                                PieChartDataEntry(value: 20, label: "")]
    private lazy var social4 = [PieChartDataEntry(value: 70, label: GnhSocialQuestions.question4),
                                PieChartDataEntry(value: 30, label: "")]
    private lazy var social5 = [PieChartDataEntry(value: 80, label: GnhSocialQuestions.question5),
                                PieChartDataEntry(value: 20, label: "")]
    private lazy var social6 = [PieChartDataEntry(value: 30, label: GnhSocialQuestions.question6),
                                PieChartDataEntry(value: 20, label: "")]
    private lazy var social7 = [PieChartDataEntry(value: 30, label: GnhSocialQuestions.question7),
                               PieChartDataEntry(value: 20, label: "")]
    private lazy var social8 = [PieChartDataEntry(value: 30, label: GnhSocialQuestions.question8),
                                PieChartDataEntry(value: 20, label: "")]
    private lazy var social9 = [PieChartDataEntry(value: 30, label: GnhSocialQuestions.question9),
                                   PieChartDataEntry(value: 20, label: "")]
    
    private lazy var entries = [social1, social2, social3,
                                social4, social5, social6,
                                social7, social8, social9]
    
    private var headerEntry: [PieChartDataEntry] = []
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let headerIdentifier = "headerIdentifier"
    private let space: CGFloat = 20
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .backgroundColor
        cv.contentInset = UIEdgeInsets(top: space, left: 0, bottom: 0, right: 0)
        cv.delegate = self
        cv.dataSource = self
        cv.register(GnhCell.self, forCellWithReuseIdentifier: identifier)
        cv.register(GnhHeaderView.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: headerIdentifier)
        return cv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 24)
        label.textColor = .titleTextColor
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - lifecycle
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,
         headerEntry: [PieChartDataEntry], category: String) {
        self.headerEntry = headerEntry
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        titleLabel.text = category
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: topSafeAreaHeight + 10)
    }
}

// MARK: - UICollectionViewDataSource

extension GnhViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GnhCell
        cell.entryData = entries[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! GnhHeaderView
        header.entryData = headerEntry
        return header
    }
}

// MARK: - UICollectionViewDelegate

extension GnhViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GnhViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - space * 2, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    }
}
