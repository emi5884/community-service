//
//  Item.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/08.
//

import UIKit

struct SearchAll  {
    let itemModel: ItemModel?
    let foodModel: FoodModel?
    let eventModel: EventModel?
    let spaceModel: SpaceModel?
    let learnModel: LearnModel?
    let communityModel: CommunityModel?
    let solutionModel: SolutionModel?
    let recommendModel: RecommendModel?
    
    var sectionCount: Int {
        return 9
    }
    
    init(itemModels: ItemModel? = nil, foodModel: FoodModel? = nil,
         eventModel: EventModel? = nil, spaceModel: SpaceModel? = nil,
         learnModel: LearnModel? = nil, communityModel: CommunityModel? = nil,
         solutionModel: SolutionModel? = nil, recommendModel: RecommendModel? = nil) {
        
        self.itemModel = itemModels
        self.foodModel = foodModel
        self.eventModel = eventModel
        self.spaceModel = spaceModel
        self.learnModel = learnModel
        self.communityModel = communityModel
        self.solutionModel = solutionModel
        self.recommendModel = recommendModel
    }
}
