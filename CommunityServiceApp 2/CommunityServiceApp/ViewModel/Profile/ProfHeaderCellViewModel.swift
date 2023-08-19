//
//  StandardProfileCellViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

struct ProfHeaderCellViewModel {
    
    var header: Header?
    
    var background: UIImage {
        return header?.background ?? UIImage(named: "image2")!
    }
    
    var icon: UIImage {
        return header?.icon ?? UIImage(named: "image2")!
    }
    
    var name: String {
        return header?.name ?? ""
    }
    
    var membership: String {
        return header?.membership ?? ""
    }

    init(header: Header) {
        self.header = header
    }
}
