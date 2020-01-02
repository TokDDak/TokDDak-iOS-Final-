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
    
    var baseURL: URL {
        return URL(string: "http://13.125.42.117:3000")!
    }
    
    var path: String {
        switch self {
        case let .medianHotelRead(cityID, subCategory):
            return "/median/\(cityID)/\(subCategory)/hoteliOS/"
        case let .cityActivity(cityID):
            return "/citys/\(cityID)/Activity"
        }
    }
    
    var method: Method {
        switch self {
        case .medianHotelRead:
            return .get
        case .cityActivity:
            return .get
        }
    }
    
    var sampleData: Data {
        return .init()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
