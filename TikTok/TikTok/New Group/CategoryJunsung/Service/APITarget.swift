//
//  APITarget.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Moya

enum APITarget: TargetType {
    case medianHotelRead(cityID: Int)
    
    var baseURL: URL {
        return URL(string: "http://13.125.42.117:3000")!
    }
    
    var path: String {
        switch self {
        case let .medianHotelRead(cityID):
            return "/median/\(cityID)/hotel/"
        }
    }
    
    var method: Method {
        switch self {
        case .medianHotelRead:
            return .get
        }
    }
    
    var sampleData: Data {
        return .init()
    }
    
    var task: Task {
        switch self {
        case .medianHotelRead:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .medianHotelRead:
            return ["Content-Type": "application/json"]
        }
    }
}
