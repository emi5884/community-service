//
//  FundWishViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/15.
//

import UIKit

struct FundWishViewModel {
    let cell: FundWish
    
    var title: String {
      return cell.title
    }
    
    var description: String {
        return cell.description
    }
    
    init(cell: FundWish) {
        self.cell = cell
    }
}
