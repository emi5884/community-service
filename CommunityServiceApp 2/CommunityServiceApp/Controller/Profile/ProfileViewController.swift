//
//  ProfileViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit

enum ProfileCategory: Int {
    case header = 0
    case project = 1
    case learning = 2
    case certificate = 3
    case volunteer = 4
    case skill = 5
    case assistance = 6
    
    func getTitle(section: Int) -> String {
        guard let category = ProfileCategory(rawValue: section) else { return "" }
        
        switch category {
        case .header:
            return ""
        case .project:
            return "プロジェクト"
        case .learning:
            return "ラーニング"
        case .certificate:
            return "資格"
        case .volunteer:
            return "ボランティア"
        case .skill:
            return "スキル"
        case .assistance:
            return "支援"
        }
    }
}

class ProfileViewController: UIViewController {
    
    // MARK: - data
    
    private let contents: [TopMenuModel] = [TopMenuModel(image: #imageLiteral(resourceName: "identification-card-light"), text: "プロフィール"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "door-light"), text: "おすすめ"),
                                            TopMenuModel(image: #imageLiteral(resourceName: "wallet-light"), text: "ウォレット")]
    
    // MARK: - Properties
    
    private let headerIdentifier = "headerIdentifier"
    private let standardIdentifier = "standardIdentifier"
    private let skillIdentifier = "skillIdentifier"
    private let assistanceActivityIdentifier = "assistanceActivityIdentifier"
    private var sectionTestData: ProfileModel = testModels
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tv.dataSource = self
        tv.delegate = self
        tv.register(ProfileHeaderCell.self, forCellReuseIdentifier: headerIdentifier)
        tv.register(StandardProfileCell.self, forCellReuseIdentifier: standardIdentifier)
        tv.register(SkillProfileCell.self, forCellReuseIdentifier: skillIdentifier)
        tv.register(AssistanceActivityProfileCell.self, forCellReuseIdentifier: assistanceActivityIdentifier)
        return tv
    }()
    
    private lazy var topMenu: CommunityTopMenu = {
        let menu = CommunityTopMenu(frame: .zero, contents: contents, isMypage: true)
        menu.delegate = self
        return menu
    }()
    
    private let testProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundColor
        button.setTitle("プロフィール", for: .normal)
        button.setTitleColor(.titleTextColor, for: .normal)
        button.titleLabel?.font = .zenKakuMedium(size: 14)
        return button
    }()
    
    private let padding: CGFloat = 10
    
    private var defaultUnderBar: DefaultUnderBar?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopMenu()
        
        view.addSubview(tableView)
        tableView.centerX(inView: view)
        tableView.setWidth(view.frame.width)
        tableView.anchor(top: topMenu.bottomAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         paddingTop: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - helper
    
    func setupTopMenu() {
        let menuHeight: CGFloat = 50
        let iconSize: CGFloat = 30
        let spaceBetweenIconAndLabel: CGFloat = 5
        
        view.addSubview(topMenu)
        topMenu.setHeight(menuHeight)
        topMenu.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       left: view.leftAnchor,
                       right: view.rightAnchor,
                       paddingTop: padding)
        
        let barWidth: CGFloat = 30
        let width = view.getCellWidth(category: contents[0].text, size: 15) + iconSize + spaceBetweenIconAndLabel
        defaultUnderBar = DefaultUnderBar(frame: CGRect(x: width / 2 - barWidth / 2,
                                                        y: topSafeAreaHeight + menuHeight,
                                                        width: barWidth,
                                                        height: 5))
        view.addSubview(defaultUnderBar ?? UIView())
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTestData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch ProfileCategory(rawValue: section) {
        case .header:
            return 1
            
        case .project:
            return testModels.project.count
            
        case .learning:
            return testModels.learning.count
            
        case .certificate:
            return testModels.certification.count
            
        case .volunteer:
            return testModels.volunteer.count
            
        case .skill:
            return testModels.skill.count
            
        case .assistance:
            return testModels.assistanceActivity.count
        
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch ProfileCategory(rawValue: indexPath.section) {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: headerIdentifier, for: indexPath) as! ProfileHeaderCell
            cell.header = sectionTestData.header
            return cell
            
        case .project:
            let cell = tableView.dequeueReusableCell(withIdentifier: standardIdentifier, for: indexPath) as! StandardProfileCell
            cell.info = sectionTestData.project[indexPath.row]
            return cell
            
        case .learning:
            let cell = tableView.dequeueReusableCell(withIdentifier: standardIdentifier, for: indexPath) as! StandardProfileCell
            cell.info = sectionTestData.learning[indexPath.row]
            return cell
            
        case .certificate:
            let cell = tableView.dequeueReusableCell(withIdentifier: standardIdentifier, for: indexPath) as! StandardProfileCell
            cell.info = sectionTestData.certification[indexPath.row]
            return cell
            
        case .volunteer:
            let cell = tableView.dequeueReusableCell(withIdentifier: standardIdentifier, for: indexPath) as! StandardProfileCell
            cell.info = sectionTestData.volunteer[indexPath.row]
            return cell
            
        case .skill:
            let cell = tableView.dequeueReusableCell(withIdentifier: skillIdentifier, for: indexPath) as! SkillProfileCell
            cell.info = sectionTestData.skill[indexPath.row]
            return cell
            
        case .assistance:
            let cell = tableView.dequeueReusableCell(withIdentifier: standardIdentifier, for: indexPath) as! StandardProfileCell
            cell.info = sectionTestData.assistanceActivity[indexPath.row]
            return cell
        
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let width: CGFloat = tableView.frame.width
        let height: CGFloat = 50
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        headerView.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: width, height: height))
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 22)
        
        headerView.addSubview(label)
        
        let category = ProfileCategory(rawValue: section)
        let title = category?.getTitle(section: section)
        label.text = title
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 50
    }
}

// MARK: - CommunityTopMenuDelegate

extension ProfileViewController: CommunityTopMenuDelegate {
    func didTapWallet() {
        let controller = WalletViewController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}
