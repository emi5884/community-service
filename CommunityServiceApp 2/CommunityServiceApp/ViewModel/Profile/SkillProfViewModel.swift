//
//  StandardProfileCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

struct SkillProfCellViewModel {

    var info: SkillInfo?

    var refereeIcon: UIImage {
        return info?.refereeIcon ?? UIImage(named: "image2")!
    }

    var title: String {
        return info?.title ?? ""
    }

    var referee: String {
        return info?.referee ?? ""
    }

    init(info: SkillInfo) {
        self.info = info
    }
}
