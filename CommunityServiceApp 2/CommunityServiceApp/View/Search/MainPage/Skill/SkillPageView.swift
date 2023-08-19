//
//  SkillPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/12.
//

import UIKit

class SkillPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let mes1 = "地域留学支援制度に参加し、酒造りの成長戦略や経営哲学を学ぶプログラムを提供しています。ご参加お待ちしています。"
    private let des1 = "1902年創業の老舗酒造会社。日本酒だけではなくジンやウォッカ、ウィスキーを製造。57か国に輸出し、岩手から世界を目指す蔵元。"
    
    private let mes2 = "参加者のレベルに応じた日本語学習のサポートをしています。日本語を学習してる方や日本語学習のサポートに興味がある方は、ぜひお気軽にご参加ください。"
    private let des2 = "多文化共生のまちづくりを目指し、異文化交流イベント等を開催。自分の興味・関心や得意分野を生かしたボランティアに参加してみませんか？"
    
    private let mes3 = "井の頭公園内を巡回し、動物の魅力を伝えるお手伝いをしています。"
    private let des3 = "日本で始めての動物園ボランティアとして誕生。動物が大好きな20代〜80代のメンバーで動物園の社会教育機能を高める取り組みをしています！"
    
    private lazy var skill1 = Skill(image: #imageLiteral(resourceName: "member5"), icon: #imageLiteral(resourceName: "sake_icon"), supplier: "酒造会社",
                                    title: "酒造り", message: mes1, description: des1)
    
    private lazy var skill2 = Skill(image: #imageLiteral(resourceName: "member11"), icon: #imageLiteral(resourceName: "international_icon"), supplier: "国際交流協会",
                                    title: "日本語学習サポート", message: mes2, description: des2)
    
    private lazy var skill3 = Skill(image: #imageLiteral(resourceName: "member8"), icon: #imageLiteral(resourceName: "zoo_icon"), supplier: "動物園協会",
                                    title: "動物の生態や魅力の解説", message: mes3, description: des3)
    
    private lazy var skills = [skill1, skill2, skill3]
    
    // MARK: - property
    
    private let identifier = "idntifier"
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.register(SkillCell.self, forCellReuseIdentifier: identifier)
        tv.backgroundColor = .backgroundColor
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

// MARK: - UICollectionViewDataSource

extension SkillPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SkillCell
        cell.viewModel = SkillCellViewModel(cell: skills[indexPath.row])
        return cell
    }
}
