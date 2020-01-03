//
//  TripCreateResponseModel.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/03.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

typealias TripCreateResponseModel = BaseResponseModel<_TripCreateResponseModel>

struct _TripCreateResponseModel: Decodable {
    let start: String
    let end: String
    let useCost: Int
    let status: Int
    let id: Int
    let title: String
    let city: String
    let country: String
    let activityBudget: Int
    let hotelBudget: Int
    let foodBudget: Int
    let shoppingBudget: Int
    let snackBudget: Int
    let transportBudget: Int
    let totalDay: Int
    let userID: String
    let updatedAt: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case start
        case end
        case useCost
        case status
        case id
        case title
        case city
        case country
        case activityBudget
        case hotelBudget
        case foodBudget
        case shoppingBudget
        case snackBudget
        case transportBudget
        case totalDay
        case userID = "UserId"
        case updatedAt
        case createdAt
    }
}

struct TripCreateRequestModel: Encodable {
    let title: String
    let start: String
    let end: String
    let activityBudget: Int
    let hotelBudget: Int
    let foodBudget: Int
    let shoppingBudget: Int
    let snackBudget: Int
    let transportBudget: Int
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case start
        case end
        case activityBudget
        case hotelBudget
        case foodBudget
        case shoppingBudget
        case snackBudget
        case transportBudget
        case userID = "UserId"
    }
}
