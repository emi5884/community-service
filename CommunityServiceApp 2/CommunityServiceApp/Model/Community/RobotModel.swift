//
//  RobotModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/25.
//

import UIKit

struct Robot {
    let image: UIImage
    let message: String
    let isSelf: Bool
    
    init(image: UIImage, message: String, isSelf: Bool) {
        self.image = image
        self.message = message
        self.isSelf = isSelf
    }
}
