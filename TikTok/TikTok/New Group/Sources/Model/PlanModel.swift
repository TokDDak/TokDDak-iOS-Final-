//
//  PlanModel.swift
//  TikTok
//
//  Created by IJ . on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

struct PlanModel {
    struct Category {
        var cost: Int
        var section: Int
        var item: Int
    }
    var day: Int
    var totalCost: Int
    var individualCategory: [Category]
}
