//
//  ReportView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/04.
//

import UIKit

class ReportPageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let content1 = "知人の会社の敷地内にテントを張り、愛護センター引き出し後行き場のなかった黒い犬「マナ」の預かりを始める。"
    
    private let content2 = "Facebookで、「犬を保護するためのプレハブ下さい！」と呼びかけ入手。現在のシェルターの1号プレハブが出来る。"
    
    private let content3 = "団体間で響動し、沖縄県初、「ガス処分なしの年末」を達成"
    private let content4 = "”保護犬を家族に迎えよう！”の旗を掲げ、上城公園から小里動物愛護センターまで計40kmを3日かけて徒歩で移動。"
    private let content5 = "寄付金で購入した軽トラでボランティアさんと「保護犬宣伝カー」をつくり、モバイルハッピードッグプロジェクトを開始。"
    private let content6 = "保護犬が家慣れ・人慣れしていくためのシェアハウス。保護犬を身近に感じてもらえるよう、保護犬のシェアハウスでの様子をsnsで発信。"
    
    private lazy var report1 = FundReport(title: "保護活動開始",
                                          contents: content1, date: "2017.7")
    
    private lazy var report2 = FundReport(title: "シェルター第一号",
                                          contents: content2, date: "2017.12")
    
    private lazy var report3 = FundReport(title: "県内初ガス処分なしの年末",
                                          contents: content3, date: "2017.12")
    
    private lazy var report4 = FundReport(title: "保護犬啓蒙ウォーキング活動",
                                          contents: content4, date: "2018.11")
    
    private lazy var report5 = FundReport(title: "モバイルハッピードッグ完成",
                                          contents: content5, date: "2019.2")
    
    private lazy var report6 = FundReport(title: "保護犬シェアハウス第一号",
                                          contents: content6, date: "2021")
    
    private lazy var reports = [report6, report5, report4, report3, report2, report1]
    
    // MARK: - property
    
    private let identifier = "identifier"
    private let padding: CGFloat = 15
    
    private lazy var tableView: UITableView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UITableView()
        cv.contentInset = UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0)
        cv.dataSource = self
        cv.register(ReportCell.self, forCellReuseIdentifier: identifier)
        return cv
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

extension ReportPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ReportCell
        cell.viewModel = FundReportViewModel(cell: reports[indexPath.row], index: indexPath.row)
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ReportPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - padding * 2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
