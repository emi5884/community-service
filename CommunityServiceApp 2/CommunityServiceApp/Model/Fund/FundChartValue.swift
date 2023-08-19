//
//  FundChartModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/28.
//

import Foundation

enum FundChartValue: Int {
    case kids = 0
    case society = 1
    case animal = 2
    case environment = 3
    case peace = 4
    case health = 5
    case city = 6
    case education = 7
    case culture = 8
    
    
    var doubleValue: Double {
        switch self {
        case .kids:
            return 18
        case .society:
            return 18
        case .animal:
            return 14
        case .environment:
            return 10
        case .peace:
            return 10
        case .health:
            return 9
        case .city:
            return 8
        case .education:
            return 7
        case .culture:
            return 6
        }
    }
    
    var intValue: Int {
        switch self {
        case .kids:
            return 18
        case .society:
            return 18
        case .animal:
            return 14
        case .environment:
            return 12
        case .peace:
            return 10
        case .health:
            return 8
        case .city:
            return 7
        case .education:
            return 7
        case .culture:
            return 6
        }
    }
}
