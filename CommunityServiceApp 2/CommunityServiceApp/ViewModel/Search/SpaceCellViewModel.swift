//
//  SpaceCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

struct SpaceCellViewModel {
    let cell: Space
    
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
        return cell.label
    }
    
    init(cell: Space) {
        self.cell = cell
    }
}
