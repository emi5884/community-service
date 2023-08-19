//
//  GnhHeader.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/29.
//

import UIKit
import DGCharts

class GnhHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    var entryData: [PieChartDataEntry]? {
        didSet {
            guard let entry = entryData else { return  }
            createChart(entry: entry)
        }
    }
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createChart(entry: [PieChartDataEntry]) {
        
        let dataSet = PieChartDataSet(entries: entry, label: "")
        dataSet.colors = [.earthLightPink, .earthPurpleBlue]
        
        let data = PieChartData(dataSet: dataSet)
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        data.setValueFont(.boldSystemFont(ofSize: 14))
        
        let chartView = PieChartView()
        chartView.data = data
        chartView.drawHoleEnabled = false
        chartView.drawEntryLabelsEnabled = false
        chartView.legend.enabled = false
        
        addSubview(chartView)
        chartView.setDimensions(height: frame.height, width: frame.height)
        chartView.centerX(inView: self)
        chartView.centerY(inView: self)
    }
}
