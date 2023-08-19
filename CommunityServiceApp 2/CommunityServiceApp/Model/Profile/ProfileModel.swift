//
//  Profile.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

struct ProfileModel {
    let header: Header
    let project: [StandardInfo]
    let learning: [StandardInfo]
    let certification: [StandardInfo]
    let volunteer: [StandardInfo]
    let skill: [SkillInfo]
    let assistanceActivity: [StandardInfo]
    let count: Int
}

struct Header {
    let icon: UIImage
    let background: UIImage
    let name: String
    let membership: String
}

struct ActivityInfo {
    let icon: UIImage
    let content: String
    let like: Int
}

struct StandardInfo {
    let icon: UIImage
    let title: String
    let subTitle: String?
    let period: String?
    let content: String
}

struct SkillInfo {
    let title: String
    let refereeIcon: UIImage
    let referee: String
}

struct InterestInfo {
    let icon: UIImage
    let name: String
    let follower: String
}

struct RecommendationInfo {
    let icon: UIImage
    let title: String
    let content: String
}

//struct AwardInfo {
//    let title: String
//    let subTitle: String
//    let content: String
//}

