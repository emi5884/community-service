//
//  ItemCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

struct ItemCellViewModel {
    let cell: Item
    
    var image: UIImage? {
        return cell.image
    }
    
    var icon: UIImage? {
        return cell.icon
    }
    
    var supplier: String {
        return cell.supplier
    }
    
    var title: String {
        return cell.title
    }
    
    var price: String {
        return cell.price == 0 ? "free" : "¥\(cell.price)"
    }
    
    init(cell: Item) {
        self.cell = cell
    }
}

