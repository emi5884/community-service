//
//  FundReportViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/15.
//

import UIKit

struct FundReportViewModel {
    let cell: FundReport
    let index: Int
    
    var title: String {
        return cell.title
    }
    
    var contents: String {
        return cell.contents
    }
    
    var date: String {
        return cell.date
    }
    
    init(cell: FundReport, index: Int) {
        self.cell = cell
        self.index = index
    }
}
