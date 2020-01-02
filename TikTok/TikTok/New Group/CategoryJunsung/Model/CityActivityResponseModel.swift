//
//  CityActivityResponseModel.swift
//  TikTok
//
//  Created by IJ . on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

typealias CityActivityResponseModel = BaseResponseModel<_CityActivityResponseModel>

struct _CityActivityResponseModel: Decodable {
    let id: Int
    let name: String
    let cost: Int
    let content: String
    let urlMRT: String
    let urlKL: String
    let image: String
    let cityID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cost
        case content
        case urlMRT = "url_mrt"
        case urlKL = "url_kl"
        case image = "img"
        case cityID = "CityId"
    }
}
