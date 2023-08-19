//
//  FundViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/14.
//

import UIKit

struct FundCellViewModel {
    let cell: Fund
    
    var image: UIImage? {
        return cell.image
    }
    
    var icon: UIImage? {
        return cell.icon
    }
    
    var supplier: String {
        return cell.supplier
    }
    
    var vision: String {
        return cell.vision
    }
    
    var message: String {
        return cell.message
    }
    
    var activity: String {
        return cell.activity
    }
    
    var category: String {
        return cell.category
    }
    
    init(cell: Fund) {
        self.cell = cell
    }
}
