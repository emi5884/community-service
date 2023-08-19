//
//  StandardProfileCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

struct ActivityProfCellViewModel {
    
    var info: ActivityInfo?
    
    var icon: UIImage {
        return info?.icon ?? UIImage(named: "image2")!
    }
    
    var content: String {
        return info?.content ?? ""
    }
    
    var like: String {
        let str = String(info?.like ?? 0)
        return str == "0" ? "" : str
    }
    
    init(info: ActivityInfo) {
        self.info = info
    }
}
