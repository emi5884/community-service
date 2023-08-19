//
//  GnhSurveyCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/30.
//

import UIKit

protocol GnhSurveyCellDelegate {
    func didChangeSwitchValue()
}

class GnhSurveyCell: UITableViewCell {
    
    // MARK: - property
    
    var delegate: GnhSurveyCellDelegate?
    
    var surveyViewModel: GnhSurveyViewModel? {
        didSet { configureUI() }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 18)
        label.textColor = .titleTextColor
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .zenKakuMedium(size: 16)
        label.textColor = .titleTextColor
        return label
    }()
    
    private lazy var switchControl: UISwitch = {
        let sc = UISwitch()
        sc.isOn = true
        sc.isEnabled = true
        sc.addTarget(self, action: #selector(didChangeSwitchValue), for: .valueChanged)
        return sc
    }()
    
    private let upArrow: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "down_line")
        return iv
    }()
    
    private let downArrow: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "up_line")
        return iv
    }()
    
    // MARK: - lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let padding: CGFloat = 15
        
        addSubview(switchControl)
        switchControl.anchor(right: rightAnchor, paddingRight: padding)
        switchControl.centerY(inView: self)
        
        addSubview(upArrow)
        upArrow.anchor(right: rightAnchor, paddingRight: padding)
        upArrow.centerY(inView: self)
        
        addSubview(downArrow)
        downArrow.anchor(right: rightAnchor, paddingRight: padding)
        downArrow.centerY(inView: self)
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: self)
        titleLabel.anchor(left: leftAnchor, paddingLeft: padding)
        
        addSubview(questionLabel)
        questionLabel.centerY(inView: self)
        questionLabel.anchor(left: leftAnchor,
                     right: switchControl.leftAnchor,
                     paddingLeft: padding,
                     paddingRight: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - action
    
    @objc func didChangeSwitchValue() {
        delegate?.didChangeSwitchValue()
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let surveyViewModel = surveyViewModel else { return }
        let isOpen = surveyViewModel.isOpen
        titleLabel.text = surveyViewModel.text
        questionLabel.text = surveyViewModel.text
        
        if surveyViewModel.isTitle {
            titleLabel.isHidden = false
            questionLabel.isHidden = true
            switchControl.isHidden = true
            upArrow.isHidden = isOpen ? true : false
            downArrow.isHidden = isOpen ? false : true
            
        } else {
            switchControl.isHidden = false
            upArrow.isHidden = true
            downArrow.isHidden = true
            titleLabel.isHidden = true
            questionLabel.isHidden = false
        }
    }
}
