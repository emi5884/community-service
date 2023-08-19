//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct SpaceModel {
    let title = "Space"
    let spaces: [Space]
    
    init(spaces: [Space]) {
        self.spaces = spaces
    }
}

struct Space {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let label: String
    
    init(image: UIImage, icon: UIImage, supplier: String, title: String, label: String) {
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.label = label
    }
}
