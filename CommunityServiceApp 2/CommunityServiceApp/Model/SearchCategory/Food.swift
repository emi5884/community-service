//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct FoodModel {
    let title = "Food"
    let foods: [Food]
    
    init(foods: [Food]) {
        self.foods = foods
    }
}

struct Food {
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
