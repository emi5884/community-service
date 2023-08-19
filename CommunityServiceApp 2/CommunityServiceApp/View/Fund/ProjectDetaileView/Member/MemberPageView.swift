//
//  ProjectCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/02.
//

import UIKit

class MemberPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let message1 = "県内の殺処分を0にしたいと思い設立しました。動物たちが幸せに暮らしていける世界を目指しています。"
    private lazy var member1 = FundMember(icon: #imageLiteral(resourceName: "member10"), message: message1)
    
    private let message2 = "犬たちをハッピーにしたいと思いSNSで里親探しをしています。殺処分の現状を知ってもらうことで、みんなで現状を変えていけると信じて活動しています。"
    private  lazy var member2 = FundMember(icon: #imageLiteral(resourceName: "member4"), message: message2)
    
    private  lazy var members = [member1, member2]
    private let supporters = [#imageLiteral(resourceName: "member11"),#imageLiteral(resourceName: "member1"), #imageLiteral(resourceName: "member7"),#imageLiteral(resourceName: "member3"),#imageLiteral(resourceName: "petshop_icon_2"), #imageLiteral(resourceName: "member6"),#imageLiteral(resourceName: "member9"),#imageLiteral(resourceName: "member5"), #imageLiteral(resourceName: "member8"), #imageLiteral(resourceName: "member2"), #imageLiteral(resourceName: "petshop_icon_3")]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let supporterTitleIdentifier = "supporterTitleIdentifier"
    private let supporterIdentifier = "supporterIdentifier"
    
    private let padding: CGFloat = 20
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(MemberCell.self, forCellReuseIdentifier: identifier)
        tv.register(SupporterTitleCell.self, forCellReuseIdentifier: supporterTitleIdentifier)
        tv.register(SupporterListCell.self, forCellReuseIdentifier: supporterIdentifier)
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .none
        tv.backgroundColor = .backgroundColor
        tv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        return tv
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        tableView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension MemberPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < members.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MemberCell
            cell.viewModel = FundMemberViewModel(cell: members[indexPath.row])
            return cell
            
        } else if indexPath.row == members.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            cell.backgroundColor = .backgroundColor
            return cell
            
        } else if indexPath.row == members.count + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: supporterTitleIdentifier, for: indexPath) as! SupporterTitleCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: supporterIdentifier, for: indexPath) as! SupporterListCell
        cell.supporters = supporters
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MemberPageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row < members.count {
            return UITableView.automaticDimension
            
        } else if indexPath.row == members.count {
            return 10
            
        } else if indexPath.row == members.count + 1 {
            return 80
        }
        
        let row = CGFloat(supporters.count / 5) + 1
        return frame.width / 5 * row
    }
}
