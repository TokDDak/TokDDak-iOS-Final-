//
//  APIService.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import Moya

final class APIService {
    static let shared = APIService()
    private init() {}
    
    private let provider = MoyaProvider<APITarget>()
    
    func requestMedianHotel(cityID: Int, subCategory: Int, completion: @escaping (Result<MedianHotelResponseModel, Error>) -> Void) {
        provider.request(.medianHotelRead(cityID: cityID, subCategory: subCategory)) { result in
            switch result {
            case let .success(success):
                let responseData = success.data
                do {
                    let decoded = try JSONDecoder().decode(MedianHotelResponseModel.self, from: responseData)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func requestCityActivity(cityID: Int, completion: @escaping (Result<CityActivityResponseModel, Error>) -> Void) {
        provider.request(.cityActivity(cityID: cityID)) { result in
            switch result {
            case let .success(success):
                let responseData = success.data
                do {
                    let decoded = try JSONDecoder().decode(CityActivityResponseModel.self, from: responseData)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
