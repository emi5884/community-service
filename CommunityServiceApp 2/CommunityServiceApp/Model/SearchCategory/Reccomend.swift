//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct RecommendModel {
    let title = "Recommend"
    let recommends: [Recommend]
    
    init(recommends: [Recommend]) {
        self.recommends = recommends
    }
}

struct Recommend {
    let image: UIImage
    let supplier: String
    let title: String
    let description: String
    let tags: [String]
    
    init(image: UIImage, supplier: String, title: String, description: String, tags: [String]) {
        self.image = image
        self.supplier = supplier
        self.title = title
        self.description = description
        self.tags = tags
    }
}
