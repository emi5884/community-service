//
//  ItemViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/10.
//

import UIKit

struct EventCellViewModel {
    let cell: Event
    
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
    
    var description: String {
        return cell.description
    }
    
    init(cell: Event) {
        self.cell = cell
    }
}
