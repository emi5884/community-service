//
//  SkillViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/13.
//

import UIKit

struct SkillCellViewModel {
    let cell: Skill
    
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
    
    var message: String {
        return cell.message
    }
    
    var description: String {
        return cell.description
    }
    
    init(cell: Skill) {
        self.cell = cell
    }
}
