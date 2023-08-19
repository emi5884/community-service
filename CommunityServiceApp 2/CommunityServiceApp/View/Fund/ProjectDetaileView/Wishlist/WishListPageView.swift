//
//  WishListPageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/13.
//

import UIKit

class WishListPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let des1 = "腎臓、尿管に異常があるブチちゃんに食べさせています。"
    private let des2 = "施設には猫のトイレが15個以上あり、トイレを清潔に保つためにも猫砂を定期的に交換したいです。 "
    private let des3 = "高齢の猫8頭に食べさせていますが、消費が早く1週間で1袋食べてしまいますので、ご支援いただけると助かります。"
    private let des4 = "毎日2，3回洗濯するので消費が早いです。 ご支援いただけると大変ありがたいです。"
    private let des5 = "犬舎や猫舎で犬猫の排泄物や嘔吐物を掃除するのによく使っています。消費量が早いので、ご支援いただけると大変ありがたいです。 "
    
    private lazy var wish1 = FundWish(title: "腎臓サポートキャットフード", description: des1)
    private lazy var wish2 = FundWish(title: "猫砂", description: des2)
    private lazy var wish3 = FundWish(title: "エイジングキャットフード", description: des3)
    private lazy var wish4 = FundWish(title: "洗濯用洗剤", description: des4)
    private lazy var wish5 = FundWish(title: "トイレットペーパーダブル", description: des5)
    private lazy var wishes = [wish1, wish2, wish3, wish4, wish5]
    
    // MARK: - property
    
    private let identifier = "identifier"
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(WishListCell.self, forCellReuseIdentifier: identifier)
        tv.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    // MARK: - init
    
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

extension WishListPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! WishListCell
        cell.viewModel = FundWishViewModel(cell: wishes[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension WishListPageView: UITableViewDelegate {
}
