//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct EventModel {
    let title = "Event"
    let events: [Event]
    
    init(events: [Event]) {
        self.events = events
    }
}

struct Event {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let description: String
    let price: Int
    let tags: [String]
    
    init(image: UIImage, icon: UIImage, supplier: String, title: String,
         description: String, price: Int, tags: [String]) {
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.description = description
        self.price = price
        self.tags = tags
    }
}

