//
//  VisionPageCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/17.
//

import UIKit

class FundCategoryPageCell: UICollectionViewCell {
    
    // MARK: - property
    
    var viewModel: FundCategoryViewModel? {
        didSet { configureUI() }
    }
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private let percentText: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.font = .zenKakuMedium(size: 20)
        return label
    }()
    
    private let numberText: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 40)
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(numberText)
        numberText.centerY(inView: self)
        numberText.anchor(left: leftAnchor)
        
        addSubview(percentText)
        percentText.centerY(inView: self)
        percentText.anchor(left: numberText.rightAnchor, paddingLeft: 5)
        
        addSubview(categoryLabel)
        categoryLabel.setWidth(frame.width - 80)
        categoryLabel.anchor(top: topAnchor,
                             left: percentText.rightAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor,
                             paddingLeft: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func configureUI() {
        guard let viewModel = viewModel else { return }
        
        categoryLabel.backgroundColor = viewModel.color
        categoryLabel.text = viewModel.title
        percentText.textColor = viewModel.color
        numberText.textColor = viewModel.color
        
        let value = getPercentage(row: viewModel.indexRow)
        numberText.text = value
    }
    
    func getPercentage(row: Int) -> String {
        
        switch row {

        case FundChartValue.kids.rawValue:
            return String(FundChartValue.kids.intValue)
            
        case FundChartValue.society.rawValue:
            return String(FundChartValue.society.intValue)
            
        case FundChartValue.animal.rawValue:
            return String(FundChartValue.animal.intValue)
            
        case FundChartValue.environment.rawValue:
            return String(FundChartValue.environment.intValue)
            
        case FundChartValue.health.rawValue:
            return String(FundChartValue.health.intValue)
            
        case FundChartValue.city.rawValue:
            return String(FundChartValue.city.intValue)
            
        case FundChartValue.education.rawValue:
            return String(FundChartValue.education.intValue)
            
        case FundChartValue.culture.rawValue:
            return String(FundChartValue.culture.intValue)
            
        case FundChartValue.peace.rawValue:
            return String(FundChartValue.peace.intValue)
            
        default:
            return ""
        }
    }
}
