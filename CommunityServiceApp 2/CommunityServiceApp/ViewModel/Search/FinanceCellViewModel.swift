//
//  FinanceCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

struct FinanceCellViewModel {
    let cell: Finance
    
    var image: UIImage? {
        return cell.image
    }
    
    var icon: UIImage? {
        return cell.icon
    }
    
    var supplier: String {
        return cell.supplier
    }
    
    var type: String {
        return cell.type
    }
    
    var title: String {
        return cell.title
    }
    
    var content: String {
        return cell.content
    }
    
    var applicant: String {
        return cell.applicant
    }
    
    var supportPrice: String {
        return cell.supportPrice
    }
    
    init(cell: Finance) {
        self.cell = cell
    }
}
