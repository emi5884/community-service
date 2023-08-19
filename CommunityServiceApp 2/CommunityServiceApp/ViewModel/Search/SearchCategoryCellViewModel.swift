//
//  SearchCategoryCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/08/01.
//

import UIKit

struct SearchCategoryCellViewModel {
    let category: String
    let num: Int
    
    var textColor: UIColor {
        return num == 0 ? .titleTextColor : .systemGray
    }
    
    var isSelected: Bool {
        return num == 0 ? true : false
    }
    
    var barColor: UIColor {
        return num == 0 ? .earthPink : .clear
    }
    
    init(category: String, num: Int) {
        self.category = category
        self.num = num
    }
}
