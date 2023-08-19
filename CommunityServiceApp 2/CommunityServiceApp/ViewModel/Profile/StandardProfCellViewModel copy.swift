//
//  StandardProfileCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

struct StandardProfCellViewModel {
    
    var info: StandardInfo?
    
    var icon: UIImage {
        return info?.icon ?? UIImage(named: "image2")!
    }
    
    var title: String {
        return info?.title ?? ""
    }
    
    var subTitle: String {
        return info?.subTitle ?? ""
    }
    
    var period: String {
        return info?.period ?? ""
    }
    
    var content: String {
        return info?.content ?? ""
    }
    
    init(info: StandardInfo) {
        self.info = info
    }
}
