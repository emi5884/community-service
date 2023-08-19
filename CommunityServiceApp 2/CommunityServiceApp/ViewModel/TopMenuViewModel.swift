//
//  TopMenuViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/28.
//

import UIKit

struct TopMenuViewModel {
    var topMenu: TopMenuModel
    var num: Int
    var isMypage: Bool
    
    var image: UIImage? {
        return topMenu.image
    }
    
    var text: String {
        return topMenu.text
    }
    
    var textColor: UIColor {
        if isMypage {
            return num == 1 || num == 2 ? .systemGray : .titleTextColor
        }
        return num == 0 || num == 1 ? .systemGray : .titleTextColor
    }
    
    var backgroundColor: UIColor {
        if isMypage {
            return isFirst ? .lightBackgroundColor : .clear
        }
        return isLast ? .backgroundColor : .clear
    }
    
    var isFirst: Bool {
        return num == 0 ? true : false
    }
    
    var isLast: Bool {
        return num == 2 ? true : false
    }
    
    init(topMenu: TopMenuModel, num: Int, isMypage: Bool) {
        self.topMenu = topMenu
        self.num = num
        self.isMypage = isMypage
    }
}
