//
//  CommunityCategoryModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/02.
//

import UIKit

struct FundCategoryModel {
    let category: FundCategory
    let title: String
    
    init(category: FundCategory, title: String) {
        self.category = category
        self.title = title
    }
}

enum FundCategory: String {
    case kids = "こども支援"
    case animal = "動物愛護"
    case peace = "平和・人権"
    case environment = "環境"
    case city = "まちづくり"
    case health = "健康・医療"
    case society = "高齢者支援"
    case culture = "文化・芸術"
    case education = "教育"
    case all = "すべて"
    
    var color: UIColor {
        switch self {
        
        case .kids:
            return .earthLightPink
        case .animal:
            return .earthYellow
        case .society:
            return .earthDarkBlue
        case .environment:
            return .earthGreen
        case .city:
            return .earthPink
        case .health:
            return .earthLightBlue
        case .peace:
            return .earthLightGreen
        case .culture:
            return .earthLightOrange
        case .education:
            return .earthBlue
        case .all:
            return .earthPurpleBlue
        }
    }
}
