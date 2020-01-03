//
//  ResponseModel.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Foundation

struct BaseResponseModel<Decode: Decodable>: Decodable {
    let status: Int
    let data: Decode?
    let success: Bool
    let message: String?
}
