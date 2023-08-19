//
//  WalletViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/12.
//

import UIKit

class WalletViewController: UIViewController {
    
    // MARK: - property
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        return view
    }()
    
    private let barcodeView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "barcode")
        return iv
    }()
    
    private let qrcodeView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "qrcode")
        return iv
    }()
    
    private let barcodePayView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "barcode-thin")
        return iv
    }()
    
    private let barcodePayLabel: UILabel = {
        let label = UILabel()
        label.text = "バーコード支払い"
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .titleTextColor
        label.textAlignment = .center
        return label
    }()
    
    private let scanPayView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "scan-thin.png")
        return iv
    }()
    
    private let scanPayLabel: UILabel = {
        let label = UILabel()
        label.text = "スキャン支払い"
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .titleTextColor
        return view
    }()
    
    private lazy var walletTopView: WalletTopView = {
        let view = WalletTopView()
        view.delegate = self
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "x-light"), for: .normal)
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBackgroundColor
        setupNavButton()
        configureUI()
    }
    
    // MARK: - Helper
    
    func configureUI() {
        
        let barcodeHight: CGFloat = 100
        let spaceFromContentView: CGFloat = 60
        let paddingIncontentView: CGFloat = 20
        let contentHight: CGFloat = (barcodeHight * 2) + (paddingIncontentView * 2 + 10)
        
        view.addSubview(contentView)
        contentView.setDimensions(height: contentHight, width: view.frame.width - 50)
        contentView.centerX(inView: view)
        contentView.centerY(inView: view)
        
        view.addSubview(barcodeView)
        barcodeView.anchor(top: contentView.topAnchor,
                           left: contentView.leftAnchor,
                           right: contentView.rightAnchor,
                           paddingTop: paddingIncontentView,
                           paddingLeft: paddingIncontentView,
                           paddingRight: paddingIncontentView)
        barcodeView.setHeight(barcodeHight)
        
        view.addSubview(qrcodeView)
        qrcodeView.anchor(left: barcodeView.leftAnchor,
                          bottom: contentView.bottomAnchor,
                          right: barcodeView.rightAnchor,
                          paddingBottom: paddingIncontentView)
        qrcodeView.setHeight(barcodeHight)
        
        // bottomStackView
        
        createBottomStackView(space: spaceFromContentView)
        
        // topMenu
        view.addSubview(walletTopView)
        walletTopView.anchor(bottom: contentView.topAnchor, paddingBottom: spaceFromContentView)
        walletTopView.setDimensions(height: 100, width: view.frame.width)
        walletTopView.centerX(inView: view)
    }
    
    // MARK: - helper
    
    func setupNavButton() {
        view.addSubview(closeButton)
        closeButton.setDimensions(height: 30, width: 30)
        closeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                           left: view.leftAnchor, paddingLeft: 20)
    }
    
    func createBottomStackView(space: CGFloat) {
        let imageHeight: CGFloat = 40
        let labelHieght: CGFloat = 20
        let spacing: CGFloat = 15
        
        barcodePayView.setHeight(imageHeight)
        let barcodeContentView = UIStackView(arrangedSubviews: [barcodePayView, barcodePayLabel])
        barcodeContentView.axis = .vertical
        barcodeContentView.spacing = spacing
        
        scanPayView.setHeight(imageHeight)
        let scanContentView = UIStackView(arrangedSubviews: [scanPayView, scanPayLabel])
        scanContentView.axis = .vertical
        scanContentView.spacing = spacing
        
        let bottomStackView = UIStackView(arrangedSubviews: [barcodeContentView, scanContentView])
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        bottomStackView.anchor(top: contentView.bottomAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               paddingTop: space)
        bottomStackView.setHeight(imageHeight + spacing + labelHieght)
        
        view.addSubview(borderView)
        borderView.setWidth(0.5)
        borderView.centerX(inView: view)
        borderView.anchor(top: bottomStackView.topAnchor,
                          bottom: bottomStackView.bottomAnchor)
    }
    
    // MARK: - action
    
    @objc func didTapCancelButton() {
        self.dismiss(animated: true)
    }
}

// MARK: - WalletTopViewDelegate

extension WalletViewController: WalletTopViewDelegate {
    func showTipsView() {
        let tipsViewController = TipsViewController()
        tipsViewController.modalPresentationStyle = .fullScreen
        present(tipsViewController, animated: true)
    }
}
