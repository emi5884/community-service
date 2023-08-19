//
//  ReportCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/04.
//

import UIKit

class ReportCell: UITableViewCell {
    
    // MARK: - property
    
    var viewModel: FundReportViewModel? {
        didSet { configureUI() }
    }
    
    private let topUploadMark: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.earthPurpleBlue.cgColor
        return view
    }()
    
    private let uploadMark: UIView = {
        let view = UIView()
        view.backgroundColor = .earthPurpleBlue
        return view
    }()
    
    private let uploadLine: UIView = {
        let view = UIView()
        view.backgroundColor = .earthPurpleBlue
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .titleTextColor
        label.font = .zenKakuBold(size: 18)
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuMedium(size: 12)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.adjustLineSpace()
        return label
    }()
    
    private let uploadMarkSize: CGFloat = 15
    private lazy var topUploadMarkSize: CGFloat = uploadMarkSize + 10
    private lazy var space: CGFloat = (topUploadMarkSize - uploadMarkSize) / 2
    private lazy var padding: CGFloat = 10
    private lazy var topPadding: CGFloat = 10
    
    // MARK: - lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(uploadMark)
        uploadMark.layer.cornerRadius = uploadMarkSize / 2
        uploadMark.setDimensions(height: uploadMarkSize,
                                 width: uploadMarkSize)
        uploadMark.anchor(top: topAnchor,
                          left: leftAnchor,
                          paddingTop: padding + topPadding,
                          paddingLeft: padding + 3)
        
        addSubview(uploadLine)
        uploadLine.setWidth(2.5)
        uploadLine.centerX(inView: uploadMark)
        uploadLine.anchor(top: uploadMark.bottomAnchor,
                          bottom: bottomAnchor,
                          paddingTop: padding,
                          paddingBottom: padding)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: uploadMark.topAnchor,
                          left: uploadMark.rightAnchor,
                          right: rightAnchor,
                          paddingTop: -8,
                          paddingLeft: padding + 5,
                          paddingRight: uploadMarkSize / 2)
        
        addSubview(dateLabel)
        dateLabel.anchor(bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingBottom: padding,
                         paddingRight: padding)
        
        addSubview(contentsLabel)
        contentsLabel.anchor(top: titleLabel.bottomAnchor,
                             left: titleLabel.leftAnchor,
                             bottom: dateLabel.topAnchor,
                             right: titleLabel.rightAnchor,
                             paddingTop: 5,
                             paddingBottom: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        contentsLabel.text = viewModel.contents
        dateLabel.text = viewModel.date
        
        if viewModel.index == 0 {
            
            addSubview(topUploadMark)
            topUploadMark.layer.cornerRadius = topUploadMarkSize / 2
            topUploadMark.centerX(inView: uploadMark)
            topUploadMark.setDimensions(height: topUploadMarkSize,
                                        width: topUploadMarkSize)
            topUploadMark.anchor(top: topAnchor,
                                 paddingTop: space + topPadding)
        }
    }
}
