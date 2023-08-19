//
//  CommunityCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/12.
//

import UIKit

struct CommunityCellViewModel {
    let cell: Community
    
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
    
    var description: String {
        return cell.description
    }
    
    var tags: [String] {
        return cell.tags
    }
    
    init(cell: Community) {
        self.cell = cell
    }
}
