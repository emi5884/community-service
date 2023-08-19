//
//  FundHeaderView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/17.
//

import UIKit
import DGCharts

class FundHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    var entryData: [PieChartDataEntry]? {
        didSet {
            guard let entry = entryData else { return  }
            createChart(entry: entry)
        }
    }
    
    private let budgetLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 20)
        label.textColor = .systemGray
        label.text = "歳入\n10万円"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
    func createChart(entry: [PieChartDataEntry]) {
        
        let dataSet = PieChartDataSet(entries: entry, label: "")
        dataSet.colors = [.earthLightPink, .earthDarkBlue, .earthYellow, .earthGreen,
                          .earthPink, .earthLightBlue, .earthLightOrange, .earthBlue, .earthLightGreen,]
        
        let data = PieChartData(dataSet: dataSet)
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        data.setValueFont(.boldSystemFont(ofSize: 14))
        
        let chartView = PieChartView()
        chartView.data = data
//        chartView.drawHoleEnabled = false
        chartView.drawEntryLabelsEnabled = false
        chartView.legend.enabled = false
        
//        let legend = chartView.legend
//        legend.horizontalAlignment = .left
//        legend.verticalAlignment = .bottom
//        legend.orientation = .horizontal
//        legend.xEntrySpace = 7
//        legend.yEntrySpace = 0
//        legend.yOffset = 20
//        legend.font = .zenKakuMedium(size: 16)
//        legend.textColor = .systemGray
        
        addSubview(chartView)
        chartView.setDimensions(height: frame.height, width: frame.height)
        chartView.centerX(inView: self)
        chartView.centerY(inView: self)
        
        addSubview(budgetLabel)
        budgetLabel.centerX(inView: self)
        budgetLabel.centerY(inView: self)
    }
}

