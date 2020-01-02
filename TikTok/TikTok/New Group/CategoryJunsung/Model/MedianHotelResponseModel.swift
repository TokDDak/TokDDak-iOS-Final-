//
//  MedianHotelResponseModel.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

typealias MedianHotelResponseModel = BaseResponseModel<_MedianHotelResponseModel>

struct _MedianHotelResponseModel: Decodable {
    struct Result: Decodable {
        struct Info: Decodable {
            let name: String
            let cost: Int
        }
        let category: String
        let cost: Int
        let urlString: String
        let info: [Info]
        
        var url: URL {
            return URL(string: urlString)!
        }
        
        enum CodingKeys: String, CodingKey {
            case category
            case cost
            case urlString = "url"
            case info
        }
    }
    let result: [Result]
}
