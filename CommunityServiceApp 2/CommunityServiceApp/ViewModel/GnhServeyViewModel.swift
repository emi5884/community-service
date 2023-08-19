//
//  GnhServeyViewModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/30.
//

import UIKit

struct GnhSurveyViewModel {
    var question: String
    var row: Int
    var isOpen: Bool
    
    var text: String {
        return question
    }
    
    var isTitle: Bool {
        return row == 0 ? true : false
    }
    
    init(question: String, row: Int, isOpen: Bool) {
        self.question = question
        self.row = row
        self.isOpen = isOpen
    }
}
