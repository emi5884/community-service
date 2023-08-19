//
//  StandardProfileCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

struct InterestProfCellViewModel {

    var info: InterestInfo?

    var icon: UIImage {
        return info?.icon ?? UIImage(named: "image2")!
    }

    var name: String {
        return info?.name ?? ""
    }

    var follower: String {
        return info?.follower ?? ""
    }

    init(info: InterestInfo) {
        self.info = info
    }
}
