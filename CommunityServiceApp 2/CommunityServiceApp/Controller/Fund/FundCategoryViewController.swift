//
//  VisionViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/17.
//

import UIKit

class FundCategoryViewController: UIViewController {
    
    // MARK: - data
    
    private let animalFund1 = Fund(image: #imageLiteral(resourceName: "dog2"), icon: #imageLiteral(resourceName: "welness_icon"),
                                   supplier: "整体院",
                                   vision: "犬の整体で諦められた命を救いたい",
                                   message: "医療で改善が見込めず余命宣告された保護犬に整体を施しています。まだまだ施術を待つ保護犬が沢山います。",
                                   activity: "保護犬の施術", category: "非営利団体")
    
    private let animalFund2 = Fund(image: #imageLiteral(resourceName: "dog3"), icon: #imageLiteral(resourceName: "dog1_icon"),
                                   supplier: "聴導犬協会",
                                   vision: "保護犬からの聴導犬育成",
                                   message: "創設以来27年、保護犬の命と才能を輝かせる聴導犬育成に取り組んでいます。",
                                   activity: "殺処分対象の保護、聴導犬育成", category: "非営利団体")
    
    private let animalFund3 = Fund(image: #imageLiteral(resourceName: "dog"), icon: #imageLiteral(resourceName: "dog2_icon"),
                                   supplier: "社団法人ハッピードッグ",
                                   vision: "保護犬から始まる世界平和を",
                                   message: "保健所から殺処分対象のワンコを引き出し、新しい家族に繋げています。",
                                   activity: "殺処分対象犬の保護、譲渡活動", category: "非営利団体")
    
    private lazy var animalFunds = [animalFund1, animalFund2, animalFund3]
    
    private let fund1 = Fund(image: #imageLiteral(resourceName: "firework"), icon: #imageLiteral(resourceName: "firework_icon"),
                             supplier: "地域振興協会",
                             vision: "冬の花火で地域を盛り上げたい",
                             message: "「冬に花火を打ち上げて地域を盛り上げたい」というアイデアから始まったEaasプロジェクト。\n2200万円の支援金と2万5000人の来場者を集め、全国紙に「別府の奇策」と掲載されるなど反響を集める。\n2025年まで冬の風物詩として発展を続け、以降は行政への引き継ぎを目指しています。",
                             activity: "地域イベントの開催", category: "市民活動団体")
    
    private let fund2 = Fund(image: #imageLiteral(resourceName: "dog"), icon: #imageLiteral(resourceName: "dog4_icon"),
                             supplier: "社団法人ハッピードッグ",
                             vision: "保護犬から始まる世界平和を",
                             message: "保健所から殺処分対象のワンコを引き出し、新しい家族に繋げています。",
                             activity: "殺処分対象犬の保護、譲渡活動", category: "非営利団体")
    
    private let fund3 = Fund(image: #imageLiteral(resourceName: "eco"), icon: #imageLiteral(resourceName: "plant_icon"),
                             supplier: "サステナブルポリマー株式会社",
                             vision: "干ばつに悩む世界中の農家を助けたい",
                             message: "最先端技術を駆使し、干ばつによる世界の水不足問題の解決を目指しています。",
                             activity: "干ばつ地域向け商品の開発", category: "スタートアップ")
    
    private lazy var funds = [fund1, fund3, fund2]
    
    // MARK: - Property
    
    private let identifier = "identifier"
    private var fundCategory: FundCategory?
    private let padding: CGFloat = 15
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .backgroundColor
        cv.bounces = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(FundProjectCell.self, forCellWithReuseIdentifier: identifier)
        return cv
    }()
    
    private let titleView = UIView()
    
    private lazy var supportButton: SupportButton = {
        let view = SupportButton()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSupportButton))
        view.addGestureRecognizer(gesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "filter"), for: .normal)
        button.backgroundColor = .white
        button.contentEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
        button.layer.shadowColor = UIColor.systemGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.9
        return button
    }()

    private let coinView: CoinView = {
        let view = CoinView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private var curvedView = CurvedView(frame: .zero, startPoint: .zero, endPoint: .zero,
                                        vertex1: .zero, vertex2: .zero)
    private let titleLabel = UILabel()
    
    private var isAnimalFunds = false
    
    // MARK: - lifecycle
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,
         fundCategory: FundCategory, isAnimalFunds: Bool) {
        self.fundCategory = fundCategory
        self.isAnimalFunds = isAnimalFunds
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = fundCategory?.color
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backButtonDisplayMode = .minimal
        
        view.addSubview(titleView)
        titleView.setHeight(60)
        titleView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: titleView.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor)
        
        setupTitleView()
        setupSupportButton()
        
        view.addSubview(filterButton)
        filterButton.layer.cornerRadius = 30
        filterButton.setDimensions(height: 60, width: 60)
        filterButton.anchor(bottom: supportButton.topAnchor,
                            right: view.rightAnchor,
                            paddingBottom: 20,
                            paddingRight: 20)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        guard let mainTabVC = tabBarController as? MainTabBarController else { return }
        mainTabVC.supportButton.isHidden = true
        mainTabVC.fundButton.isHidden = true
        mainTabVC.shareButton.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        
        guard let mainTabVC = tabBarController as? MainTabBarController else { return }
        mainTabVC.supportButton.isHidden = false
        mainTabVC.fundButton.isHidden = false
        mainTabVC.shareButton.isHidden = false
    }
    
    // MARK: - ation
    
    @objc func didTapSupportButton() {
        addCurvedView()
        
        let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeOutAnimation.delegate = self
        curvedView.animarion(coinView: coinView, fadeOut: fadeOutAnimation)
    }
    
    // MARK: - helper
    
    func addCurvedView() {
        let navHeight = navigationController?.navigationBar.frame.height ?? 0
        let titleY = navHeight + 60
        let titleX = titleLabel.frame.origin.x
        
        let coinViewX = coinView.frame.origin.x + 25
        let startPoint = CGPoint(x: coinViewX, y: coinView.frame.origin.y)
        
        let endPoint = CGPoint(x: titleX, y: titleY)
        
        let vertex1: CGPoint = CGPoint(x: startPoint.x - 100, y: startPoint.y - 200)
        let vertex2: CGPoint = CGPoint(x: endPoint.x - 50,
                                       y: endPoint.y + 100)
        
        curvedView = CurvedView(frame: .zero, startPoint: startPoint, endPoint: endPoint,
                                vertex1: vertex1, vertex2: vertex2)
        
        view.addSubview(curvedView)
        curvedView.backgroundColor = .clear
        curvedView.fillSuperview()
    }
    
    func setupSupportButton() {
        view.addSubview(supportButton)
        
        let tabBarHeight: CGFloat = tabBarController?.tabBar.frame.height ?? 0
        supportButton.setHeight(tabBarHeight)
        supportButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        supportButton.backgroundColor = .white
        
        view.addSubview(coinView)
        coinView.setDimensions(height: 50, width: 50)
        coinView.anchor(top: supportButton.topAnchor,
                        left: supportButton.leftAnchor,
                        paddingTop: -20,
                        paddingLeft: 110)
    }
    
    func setupTitleView() {
        titleLabel.text = fundCategory?.rawValue
        titleLabel.textColor = .white
        titleLabel.font = .zenKakuBold(size: 28)
        
        let iconSize: CGFloat = 45
        let darkerColor = UIColor.getDarkerColor(color: fundCategory?.color ?? .white)
        
        let pertnerButton = UIButton.imageButton(image: #imageLiteral(resourceName: "handshake-light_white"), height: iconSize)
        pertnerButton.backgroundColor = darkerColor
        
        let signButton = UIButton.imageButton(image: #imageLiteral(resourceName: "note-pencil-light_white"), height: iconSize)
        signButton.backgroundColor = darkerColor
        
        let stackView = UIStackView(arrangedSubviews: [pertnerButton, signButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        titleView.addSubview(titleLabel)
        titleLabel.centerX(inView: titleView)
        titleLabel.anchor(top: titleView.topAnchor,
                          paddingTop: -20)
        
        titleView.addSubview(stackView)
        stackView.setDimensions(height: iconSize, width: iconSize * 2 + 10)
        stackView.anchor(bottom: titleView.bottomAnchor,
                         right: titleView.rightAnchor,
                         paddingBottom: 10,
                         paddingRight: 10)
    }
}

// MARK: - UICollectionViewDataSource

extension FundCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isAnimalFunds ? animalFunds.count : funds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FundProjectCell
        
        let content = isAnimalFunds ? animalFunds[indexPath.row] : funds[indexPath.row]
        cell.viewModel = FundCellViewModel(cell: content)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension FundCategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let projectViewController = ProjectViewController()
        navigationController?.pushViewController(projectViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FundCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - padding * 2, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}

// MARK: - CAAnimationDelegate

extension FundCategoryViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        coinView.removeFromSuperview()
        supportButton.didSupport()
    }
}
