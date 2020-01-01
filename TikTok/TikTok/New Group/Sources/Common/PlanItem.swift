//
//  PlanItem.swift
//  TikTok
//
//  Created by IJ . on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

enum PlanType {
    case accomodation
    case food
    case dessert
    case activity
    
    var color: UIColor? {
        switch self {
        case .accomodation:
            return UIColor(named: "accomodation")
        case .food:
            return UIColor(named: "food")
        case .dessert:
            return UIColor(named: "dessert")
        case .activity:
            return UIColor(named: "activity")
        }
    }
}

struct PlanItem {
    let title: String
    let planType: PlanType
}
