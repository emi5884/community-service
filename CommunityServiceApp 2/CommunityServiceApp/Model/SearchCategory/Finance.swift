//
//  Finance.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/23.
//

import UIKit

struct FinanceModel {
    let title = "Finance"
    let finances: [Finance]
    
    init(finances: [Finance]) {
        self.finances = finances
    }
}

struct Finance {
    let image: UIImage
    let icon: UIImage
    let supplier: String
    let title: String
    let content: String
    let applicant: String
    let supportPrice: String
    let type: FinanceType.RawValue
    
    init(image: UIImage, icon: UIImage, supplier: String, title: String,
         content: String, applicant: String, supportPrice: String, type: FinanceType.RawValue) {
        self.image = image
        self.icon = icon
        self.supplier = supplier
        self.title = title
        self.content = content
        self.applicant = applicant
        self.supportPrice = supportPrice
        self.type = type
    }
}

enum FinanceType: String {
    case benefits = "給付金"
    case subsidy = "助成金"
    case scholarship = "奨学金"
}
