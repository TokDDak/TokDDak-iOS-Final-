//
//  TotalPlanData.swift
//  TikTok
//
//  Created by IJ . on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

class TotalPlanData {
    
    static let shared = TotalPlanData()
    private init(){}
    
    var startDate: String = ""
    var endDate: String = ""
    var travelDays: Int = 0
    var cityName: String = ""
    
    
    
}
