//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct LearnModel {
    let title = "Learn"
    let learns: [Learn]
    
    init(learns: [Learn]) {
        self.learns = learns
    }
}

struct Learn {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let category: String
    let price: Int
    let skills: [String?]
    let isCertificate: Bool
    
    init(image: UIImage, icon: UIImage, supplier: String, title: String,
         category: String, price: Int, skills: [String], isCertificate: Bool) {
        
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.category = category
        self.price = price
        self.skills = skills
        self.isCertificate = isCertificate
    }
}
