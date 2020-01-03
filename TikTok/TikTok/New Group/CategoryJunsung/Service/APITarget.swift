//
//  APITarget.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Moya

enum APITarget: TargetType {
    case medianHotelRead(cityID: Int, subCategory: Int)
    case cityActivity(cityID: Int)
    case tripCreate(cityID: Int, body: TripCreateRequestModel)
    case medianFoodRead(cityID : Int)
    
    var baseURL: URL {
        return URL(string: "http://13.125.42.117:3000")!
    }
    
    var path: String {
        switch self {
        case let .medianHotelRead(cityID, subCategory):
            return "/median/\(cityID)/\(subCategory)/hoteliOS/"
        case let .cityActivity(cityID):
            return "/citys/\(cityID)/Activity"
        case let .tripCreate(cityID, _):
            return "/trips/\(cityID)"
        case let .medianFoodRead(cityID):
            return "/median/\(cityID)/food"
        }
    }
    
    var method: Method {
        switch self {
        case .medianHotelRead:
            return .get
        case .cityActivity:
            return .get
        case .tripCreate:
            return .post
        case .medianFoodRead:
            return .get
        }
        // case. sendA:
        // return .post
    }
    
    var sampleData: Data {
        return .init()
    }
    
    var task: Task {
        switch self {
        case .medianHotelRead:
            return .requestPlain     
        case .cityActivity:
            return .requestPlain
        case let .tripCreate(cityID, body):
            let encoded = try! JSONEncoder().encode(body)
            return .requestCompositeData(bodyData: encoded, urlParameters: ["CityId": cityID])
        case let .medianFoodRead(cityID):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
