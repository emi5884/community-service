//
//  GnhSurveyModel.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/30.
//

import Foundation

struct GnhSurveyModel {
    let title: String
    let questions: [String]
    var isOpen: Bool = false
    
    init(title: String, questions: [String], isOpen: Bool = false) {
        self.title = title
        self.questions = questions
        self.isOpen = isOpen
    }
}
