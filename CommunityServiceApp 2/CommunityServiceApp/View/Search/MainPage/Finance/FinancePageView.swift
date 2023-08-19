//
//  FinancePageView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

class FinancePageView: UICollectionViewCell {
    
    // MARK: - data
    
    private let fin1 = Finance(image: #imageLiteral(resourceName: "world"), icon: #imageLiteral(resourceName: "publisher"), supplier: "原作者, 出版社", title: "バスケットボール留学奨学金",
                               content: "「作品を愛してくれた読者とバスケへの恩返しがしたい」という作者の志から奨学金が始まりました。挑戦には価値があります。",
                               applicant: "バスケが大好きな高校生", supportPrice: "渡航費, 学費, 生活費", type: FinanceType.scholarship.rawValue)
    
    private let fin2 = Finance(image: #imageLiteral(resourceName: "world"), icon: #imageLiteral(resourceName: "japan_foundation"), supplier: "財団法人", title: "公益活動団体支援金",
                               content: "社会が複雑化し、公的サービスだけでは支援が行き届かない問題がたくさんあります。このような問題を解決するため、みんなで支え合う社会の実現を目指し、助成事業に取り組んでいます。",
                               applicant: "法人格を取得している団体", supportPrice: "活動費用の80%", type: FinanceType.subsidy.rawValue)
    
    private let fin3 = Finance(image: #imageLiteral(resourceName: "world"), icon: #imageLiteral(resourceName: "japan"), supplier: "国", title: "感染拡大防止給付金",
                               content: "感染拡大防止に留意しつつ家計への支援を行うことを目的とした給付金です。総務省のHPに特設のサイトが設けられていますので、詳細をご確認ください。",
                               applicant: "住民基本台帳に記録されている方", supportPrice: "10万円", type: FinanceType.benefits.rawValue)
    
    private let fin4 = Finance(image: #imageLiteral(resourceName: "world"), icon: #imageLiteral(resourceName: "merukari"), supplier: "財団法人", title: "理系女子学生奨学金",
                               content: "「すべての人が好きなことを目指せる社会に。」という理念のもと、STEM分野への進学を目指す女子学生を応援するための奨学金です。",
                               applicant: "理系分野への進学を目指す女子学生", supportPrice: "給付金, 繋がり, 情報", type: FinanceType.subsidy.rawValue)
    
    private lazy var finances = [fin1, fin2, fin3, fin4]
    
    // MARK: - Property
    
    private var isProject = false
    
    private let identifier = "identifier"
    private let padding: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(FinanceCell.self, forCellWithReuseIdentifier: identifier)
        cv.contentInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        cv.backgroundColor = .backgroundColor
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
    
    // MARK: - helper
    
    func setupCollectionView(isProject: Bool) {
        self.isProject = isProject
        collectionView.reloadData()
    }
}
    
// MARK: - UICollectionViewDataSource

extension FinancePageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return finances.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FinanceCell
        cell.viewModel = FinanceCellViewModel(cell: finances[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension FinancePageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            delegate?.showDetaileView(cell: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FinancePageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - padding * 2, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
