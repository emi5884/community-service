//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct ItemModel {
    let title = "Item"
    let items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
}

struct Item {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let price: Int
    
    init(image: UIImage, icon: UIImage, supplier: String, title: String, price: Int) {
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.price = price
    }
}
