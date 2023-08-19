//
//  Skill.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/13.
//

import UIKit

struct SkillModel {
    let title = "Skill"
    let skills: [Skill]
    
    init(skills: [Skill]) {
        self.skills = skills
    }
}

struct Skill {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let message: String
    let description: String
    
    init(image: UIImage, icon: UIImage, supplier: String,
         title: String, message: String, description: String) {
        
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.message = message
        self.description = description
    }
}
