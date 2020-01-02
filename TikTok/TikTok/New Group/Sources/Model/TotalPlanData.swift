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
    private init() {}
    
    var startDate: String = ""
    var endDate: String = ""
    var travelDays: Int = 0
    var cityName: String = ""
    /*
     var beforeTravel : [String : String] = ["cityName" : "", "startDate" : "", "endDate" : ""]
     var travelDays : Int = 0
     */
    /*준성 카테고리*/
    
    // 사용자가 고른 카테고리 true : 고른거 / false : 안고른거
    var selectedCategory : [String : Bool] = ["hotel" : true, "restaurant" : true, "drink" : true, "transport" : true, "shopping" : true, "activity" : true]
    
    
    // 각 호텔당 축적된 가격
    var totalCostOfHotel: [Hotel: Int] = [.high: 0, .middle: 0, .low: 0, .apartment: 0]
    // 각 호텔 박 수
    var totalDayOfHotel: [Hotel: Int] = [.high: 0, .middle: 0, .low: 0, .apartment: 0]
    
    
    //각 식사별 축적된 가격
    var totalCostOfFood : [Int : Int] = [0 : 0, 1 : 0, 2: 0]
    //각 식사별 축적된 갯수
    var totalCountOfFood : [Int : Int] = [0:0, 1:0, 2:0]
    
    //각 주류별 축적된 가격
    var totalCostOfDrink : [Int : Int] = [0:0, 1:0, 2:0]
    //각 주류별 축적된 갯수
    var totalCountOfDrink : [Int : Int] = [0:0, 1:0, 2:0]

    //Shopping, Transport 가격은 전역변수로 선언 되어있음
    //totalCostOfTransport, totalCostOfShopping
    
    //액티비티 총 가격
    var totalCostOfActivity : Int = 0
    //액티비티 총 갯수
    var totalCountOfActivity : Int = 0
    
    
    
}
