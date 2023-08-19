//
//  ItemViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/10.
//

import UIKit

struct FoodCellViewModel {
    let cell: Food
    
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
    
    init(cell: Food) {
        self.cell = cell
    }
}
