//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct CommunityModel {
    let title = "Community"
    let communities: [Community]
    
    init(communities: [Community]) {
        self.communities = communities
    }
}

struct Community {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let description: String
    let tags: [String]
    
    init(image: UIImage, icon: UIImage, supplier: String, title: String, description: String, tags: [String]) {
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.description = description
        self.tags = tags
    }
}
