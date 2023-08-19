//
//  RobotChatViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/25.
//

import UIKit

class RobotChatViewController: UIViewController {
    
    // MARK: - data
    
    private let gnhReply1 = "わたしたちアウトリーチワーカーのチームは「経済的な不安定さ」「身体的な健康やケガ」「家族や友人との関係」「精神的な健康」「子育てのサポート」「暴力/対立」に悩んでいる方々へ、無料かつ秘密厳守でサポートを提供しています。\n\n私たちは耳を傾け、サポートを提供するためにここにいます。"
    
    private let gnhReply2 = "最近、耳が遠くなり生活に支障をきたしています。とても不安です。"
    private let gnhReply3 = "聞こえに不便を感じている方のコミュニティが市内に2つあります。同じ課題を共有する仲間に出会えるかと思いますので、ご紹介させてください。\n\n----------------\n\n① 失調・難聴の会 (TEL: 080-xxxx-xxxx)\nメッセージ：聞こえに不便を感じられてる方、手話を学習してみませんか？お待ちしてます\n\n② 聴覚協会 (TEL: 080-xxxx-xxxx)\nメッセージ：聞こえに不便を抱えている方やご家族、ご友人の方、同じ仲間として交流を深めませんか。"
    
    private lazy var support1 = Robot(image: #imageLiteral(resourceName: "member7"), message: gnhReply1, isSelf: false)
    private lazy var support2 = Robot(image: #imageLiteral(resourceName: "member7"), message: gnhReply2, isSelf: true)
    private lazy var support3 = Robot(image: #imageLiteral(resourceName: "member7"), message: gnhReply3, isSelf: false)
    
    private let roboReply1 = "高齢で施設に引っ越すため、飼い猫を手放さなくてはいけなくなってしまいました。"
    private let roboReply2 = "市と協働して地域猫の保護活動を行なっている「地域猫の会」への相談をおすすめします。(TEL: 080-xxxx-xxxx)"
    
    private lazy var robot1 = Robot(image: #imageLiteral(resourceName: "robot_mini"), message: roboReply1, isSelf: true)
    private lazy var robot2 = Robot(image: #imageLiteral(resourceName: "robot_mini"), message: roboReply2, isSelf: false)
    
    private lazy var messages: [Robot] = idGnh ? [support1]: [robot1, robot2]
    
    // MARK: - property
    
    private let identifier = "identifier"
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .lineColor
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.register(RobotViewCell.self, forCellReuseIdentifier: identifier)
        return tv
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "x-light"), for: .normal)
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        return button
    }()
    
    private let titleView: UILabel = {
        let label = UILabel()
        label.text = "サポートAI"
        label.font = .zenKakuBold(size: 16)
        label.textColor = .titleTextColor
        return label
    }()
    
    private lazy var inputMessageView = InputView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 90))
    
    private var idGnh = false
    
    // MARK: - lifecycle
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, idGnh: Bool) {
        self.idGnh = idGnh
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lineColor
        view.addSubview(tableView)
        
        view.addSubview(titleView)
        titleView.centerX(inView: view)
        titleView.anchor(top: view.topAnchor,
                         paddingTop: 65)
        
        if idGnh {
            setupNavButton()
            titleView.isHidden = true
            tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             left: view.leftAnchor,
                             bottom: view.bottomAnchor,
                             right: view.rightAnchor,
                             paddingTop: 12)
        } else {
            tableView.fillSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        let tabBar = tabBarController as? MainTabBarController
        tabBar?.fundButton.isHidden = true
        tabBar?.supportButton.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        
        let tabBar = tabBarController as? MainTabBarController
        tabBar?.fundButton.isHidden = false
        tabBar?.supportButton.isHidden = false
    }
    
    override var inputAccessoryView: UIView? {
        get { return inputMessageView }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: - helper
    
    func setupNavButton() {
        view.addSubview(closeButton)
        closeButton.setDimensions(height: 30, width: 30)
        closeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                           left: view.leftAnchor,
                           paddingTop: -15,
                           paddingLeft: 20)
    }
    
    func calculateTextHeight(text: String) -> CGFloat {
        let padding: CGFloat = 45
        let messageWidth: CGFloat = view.frame.width - 105
        let atts: [NSAttributedString.Key: Any] = [.font: UIFont.zenKakuMedium(size: 14)]
        let size = CGSize(width: messageWidth, height: CGFloat.greatestFiniteMagnitude)
        let textRect = NSString(string: text).boundingRect(with: size,
                                                           options: .usesLineFragmentOrigin,
                                                           attributes: atts,
                                                           context: nil)
        return textRect.height + padding
    }
    
    // MARK: - action
    
    @objc func didTapCancelButton() {
        self.dismiss(animated: true)
    }
}

// MARK: - UITableViewDataSource

extension RobotChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RobotViewCell
        cell.viewModel = RobotViewModel(robot: messages[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RobotChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: tableView.rectForRow(at: indexPath).height)
        
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1
            cell.transform = CGAffineTransform.identity
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = messages[indexPath.row].message
        return calculateTextHeight(text: message)
    }
}
