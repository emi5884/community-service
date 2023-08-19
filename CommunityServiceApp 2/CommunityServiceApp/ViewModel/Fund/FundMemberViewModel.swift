//
//  FundMembers.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/16.
//

import UIKit

struct FundMemberViewModel {
    let cell: FundMember
    
    var icon: UIImage {
      return cell.icon
    }
    
    var message: String {
        return cell.message
    }
    
    init(cell: FundMember) {
        self.cell = cell
    }
}

