//
//  LearnCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/12.
//

import UIKit

struct LearnCellViewModel {
    let cell: Learn
    
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
    
    var isCertificate: Bool {
        return cell.isCertificate
    }
    
    var category: String {
        return cell.category
    }
    
    var skill1: String {
        return "□ \(cell.skills[0] ?? "")"
    }
    
    var skill2: String? {
        let skill2 = cell.skills[1] ?? ""
        return skill2 == "" ? "" : "□ \(skill2)"
    }
    
    var skill3: String? {
        let skill3 = cell.skills[2] ?? ""
        return skill3 == "" ? "" : "□ \(skill3)"
    }
    
    init(cell: Learn) {
        self.cell = cell
    }
}
