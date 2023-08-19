//
//  GnhCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/29.
//

import UIKit
import DGCharts

class GnhCell: UICollectionViewCell {
    
    // MARK: - property
    
    var entryData: [PieChartDataEntry]? {
        didSet {
            guard let entry = entryData else { return  }
            createChart(entry: entry)
            questionLabel.text = entry[0].label ?? ""
        }
    }
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .zenKakuBold(size: 15)
        label.textColor = .titleTextColor
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(view)
        view.anchor(top: topAnchor,
                    left: leftAnchor,
                    bottom: bottomAnchor,
                    right: rightAnchor,
                    paddingLeft: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - helper
    
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
        chartView.layer.shadowColor = UIColor.systemGray.cgColor
        chartView.layer.shadowOpacity = 0.5
        chartView.layer.shadowOffset = CGSize(width: 5, height: 5)
        chartView.layer.shadowRadius = 5
        
        let position: CGFloat = -20
        view.addSubview(chartView)
        chartView.centerY(inView: self)
        chartView.anchor(top: topAnchor,
                         left: leftAnchor,
                         paddingLeft: position)
        chartView.setDimensions(height: frame.height,
                                width: frame.height)
        
        view.addSubview(questionLabel)
        questionLabel.anchor(top: view.topAnchor,
                             left: chartView.rightAnchor,
                             bottom: view.bottomAnchor,
                             right: view.rightAnchor,
                             paddingTop: 10,
                             paddingLeft: 0,
                             paddingBottom: 10,
                             paddingRight: 10)
    }
}
