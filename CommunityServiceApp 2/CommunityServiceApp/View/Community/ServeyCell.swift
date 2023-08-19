//
//  CommunityCell.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/28.
//

import UIKit
import DGCharts

class ServeyCell: UICollectionViewCell {
    
    // MARK: - property
    
    var entryData: [PieChartDataEntry]? {
        didSet {
            guard let entry = entryData else { return  }
            createChart(entry: entry)
            titleLabel.text = entry[0].label ?? ""
        }
    }
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .zenKakuBold(size: 16)
        return label
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let padding: CGFloat = 10
        
        addSubview(view)
        view.anchor(top: topAnchor,
                    left: leftAnchor,
                    bottom: bottomAnchor,
                    right: rightAnchor,
                    paddingTop: padding,
                    paddingLeft: padding,
                    paddingBottom: padding,
                    paddingRight: padding)
        
        addSubview(titleLabel)
        titleLabel.anchor(left: leftAnchor,
                          bottom: view.bottomAnchor,
                          right: rightAnchor,
                          paddingBottom: 17)
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
        
        view.addSubview(chartView)
        chartView.anchor(top: topAnchor, paddingTop: 7)
        chartView.setDimensions(height: frame.width - 10, width: frame.width - 10)
        chartView.centerX(inView: self)
    }
}
