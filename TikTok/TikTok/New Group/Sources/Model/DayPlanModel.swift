//
//  DayPlanModel.swift
//  TikTok
//
//  Created by IJ . on 2020/01/03.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

//day    INTEGER    여행의 n일차
//cost    INTEGER    사용한 금액
//category    STRING(20)    해당 카테고리 (숙소, 식당, 쇼핑..)
//content    STRING(100)    카테고리 세부 내용 (고급호텔, 간편식..)
//TripId    INTEGER    여행 id 값 (FK)

struct DayPlanModel {
        
    var day: Int = 0
    var cost: Int = 0
    var category: String = ""
    var content: String = ""
    var TripId: Int = 1
}
