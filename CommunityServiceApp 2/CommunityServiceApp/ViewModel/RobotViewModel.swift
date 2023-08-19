//
//  RobotViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/25.
//

import UIKit

struct RobotViewModel {
    let robot: Robot
    
    var image: UIImage {
        return robot.image
    }
    
    var message: String {
        return robot.message
    }
    
    var isSelf: Bool {
        return robot.isSelf
    }
    
    init(robot: Robot) {
        self.robot = robot
    }
}
