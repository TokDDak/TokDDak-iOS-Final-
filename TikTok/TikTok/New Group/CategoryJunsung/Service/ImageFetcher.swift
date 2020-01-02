//
//  ImageFetcher.swift
//  TikTok
//
//  Created by IJ . on 2020/01/02.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

final class ImageFetcher {
    static func image(for url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: url)
                let image = UIImage(data: imageData)!
                completion(.success(image))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
