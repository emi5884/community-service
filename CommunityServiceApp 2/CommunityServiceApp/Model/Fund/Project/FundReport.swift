//
//  Project.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/15.
//

import UIKit

struct FundReport {
    let title: String
    let contents: String
    let date: String
    
    init(title: String, contents: String, date: String) {
        self.title = title
        self.contents = contents
        self.date = date
    }
}
