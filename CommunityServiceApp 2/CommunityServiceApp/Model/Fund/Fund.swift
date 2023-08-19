//
//  Fund.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/14.
//

import UIKit

struct Fund {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let vision: String
    let message: String
    let activity: String
    let category: String
    
    init(image: UIImage, icon: UIImage, supplier: String, vision: String,
         message: String, activity: String, category: String) {
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.vision = vision
        self.message = message
        self.activity = activity
        self.category = category
    }
}
