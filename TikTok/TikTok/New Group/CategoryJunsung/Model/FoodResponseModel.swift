//
//  FoodResponseMode.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/03.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

typealias FoodResponseModel = BaseResponseModel<_FoodResponseModel>

struct _FoodResponseModel: Decodable{
    struct Result: Decodable{
        let category : String
        let cost : Int
        let urlString : String
        
        var url: URL{
            return URL(string: urlString)!
        }
        enum CodingKeys: String, CodingKey{
            case category
            case cost
            case urlString = "url"
        }
    }
    let result : [Result]
}
