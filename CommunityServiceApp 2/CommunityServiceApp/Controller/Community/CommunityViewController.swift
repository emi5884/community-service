//
//  HomeViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit
import DGCharts

class CommunityViewController: UIViewController {
    
    // MARK: - Data
    
    private let contents: [TopMenuModel] = [TopMenuModel(image: #imageLiteral(resourceName: "info-light (1)"), text: "インフォ"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "communication"), text: "コミュニケーション"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "chart-pie"), text: "GNH"),]
    
    private let social = [PieChartDataEntry(value: 75, label: "社会"),
                          PieChartDataEntry(value: 25, label: "")]
    private let economic = [PieChartDataEntry(value: 70, label: "経済"),
                            PieChartDataEntry(value: 30, label: "")]
    private let physical = [PieChartDataEntry(value: 60, label: "健康"),
                            PieChartDataEntry(value: 40, label: "")]
    private let education = [PieChartDataEntry(value: 70, label: "教育"),
                             PieChartDataEntry(value: 30, label: "")]
    private let cultural = [PieChartDataEntry(value: 65, label: "文化"),
                            PieChartDataEntry(value: 35, label: "")]
    private let environment = [PieChartDataEntry(value: 65, label: "環境"),
                               PieChartDataEntry(value: 35, label: "")]
    private let mental = [PieChartDataEntry(value: 65, label: "メンタル"),
                          PieChartDataEntry(value: 35, label: "")]
    private let timeuse = [PieChartDataEntry(value: 75, label: "余暇"),
                           PieChartDataEntry(value: 25, label: "")]
    private let governance = [PieChartDataEntry(value: 60, label: "政治"),
                              PieChartDataEntry(value: 40, label: "")]
    
    private lazy var entries = [environment, economic, social,
                                physical, education, cultural,
                                timeuse, governance, mental]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let space: CGFloat = 10
    
    private lazy var topMenu = CommunityTopMenu(frame: .zero, contents: contents, isMypage: false)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        cv.backgroundColor = .backgroundColor
        cv.delegate = self
        cv.dataSource = self
        cv.register(ServeyCell.self, forCellWithReuseIdentifier: identifier)
        return cv
    }()
    
    private lazy var joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("回答する", for: .normal)
        button.backgroundColor = .earthPurpleBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .zenKakuBold(size: 17)
        button.addTarget(self, action: #selector(didTapJoinButton), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.setHeight(50)
        button.setWidth(150)
        button.titleEdgeInsets = UIEdgeInsets(top: -4, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var robotButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .earthDarkBlue
        button.setImage(#imageLiteral(resourceName: "robot_white_3"), for: .normal)
        button.layer.shadowColor = UIColor.earthDarkBlue.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.addTarget(self, action: #selector(didTapRobotButton), for: .touchUpInside)
        let padding: CGFloat = 8.3
        button.imageEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        return button
    }()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        
        let padding: CGFloat = 10
        
        setupTopMenu()
        setupJoinButton()
        
        view.addSubview(collectionView)
        collectionView.centerX(inView: view)
        collectionView.setWidth(view.frame.width)
        collectionView.anchor(top: topMenu.bottomAnchor,
                              bottom: joinButton.topAnchor,
                              paddingBottom: padding)
        
        setupNavButton()
        
        view.addSubview(robotButton)
        robotButton.layer.cornerRadius = 30
        robotButton.setDimensions(height: 60, width: 60)
        robotButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                           right: view.rightAnchor,
                           paddingBottom: 25,
                           paddingRight: 20)
    }
    
    // MARK: - helper
    
    func setupNavButton() {
        
        let titleLabel = UILabel()
        titleLabel.text = "蔵児市"
        titleLabel.textColor = .titleTextColor
        titleLabel.textAlignment = .center
        titleLabel.font = .zenKakuBold(size: 18)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 60)
        
        let leftButton = UIButton()
        leftButton.setImage(#imageLiteral(resourceName: "map-pin-fill"), for: .normal)
        
        view.addSubview(leftButton)
        leftButton.setDimensions(height: 45, width: 45)
        leftButton.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 42,
                          paddingLeft: 15)
    }
    
    func setupJoinButton() {
        let joinButtonBG = UIView()
        joinButtonBG.backgroundColor = .backgroundColor
        
        view.addSubview(joinButtonBG)
        joinButtonBG.anchor(top: topMenu.bottomAnchor,
                            left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingTop: 10)
        
        view.addSubview(joinButton)
        joinButton.centerX(inView: view)
        joinButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          paddingBottom: 30)
    }
    
    func setupTopMenu() {
        let menuHeight: CGFloat = 50
        let padding: CGFloat = 10
        
        view.addSubview(topMenu)
        topMenu.setHeight(menuHeight)
        topMenu.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       left: view.leftAnchor,
                       right: view.rightAnchor)
    }
    
    // MARK: - action
    
    @objc func didTapJoinButton() {
        let controller = GnhSurveyViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
                                     
    @objc func didTapRobotButton() {
        let controller = RobotChatViewController(nibName: nil, bundle: nil, idGnh: false)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension CommunityViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ServeyCell
        cell.entryData = entries[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CommunityViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ServeyCell
        guard let entry = cell.entryData else { return }
        
        let gnhViewController = GnhViewController(nibName: nil, bundle: nil,
                                                  headerEntry: entry, category: entry[0].label ?? "")
        navigationController?.pushViewController(gnhViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CommunityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - space * 2) / 3
        let height: CGFloat = (collectionView.frame.height - space * 2) / 3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
