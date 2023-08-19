//
//  SearchAllHeader.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct SearchAllHeaderViewModel {
    let searchAll: SearchAll
    let section: Int
    
    var title: String? {
        
        switch SearchCategory(rawValue: section) {
        case .item:
            return searchAll.itemModel?.title
        case .food:
            return searchAll.foodModel?.title
        case .event:
            return searchAll.eventModel?.title
        case .space:
            return searchAll.spaceModel?.title
        case .learn:
            return searchAll.learnModel?.title
        case .community:
            return searchAll.communityModel?.title
        default:
            return ""
        }
    }
    
    init(searchAll: SearchAll, section: Int) {
        self.searchAll = searchAll
        self.section = section
    }
}
