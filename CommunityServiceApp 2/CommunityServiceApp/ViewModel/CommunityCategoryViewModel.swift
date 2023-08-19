//
//  CommunityCategoryViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/02.
//

import UIKit

struct FundCategoryViewModel {
    let category: FundCategory
    let indexRow: Int
    
    var title: String {
        return category.rawValue
    }
    
    var color: UIColor {
        return category.color
    }
    
    init(category: FundCategory, indexRow: Int) {
        self.category = category
        self.indexRow = indexRow
    }
}
