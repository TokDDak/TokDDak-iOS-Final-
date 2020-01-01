//
//  PopularCityCollectionViewCell.swift
//  TikTok
//
//  Created by IJ . on 2019/12/28.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class PopularCityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var popularCityImageView: UIImageView!
    
//    let image1 = UIImage(named: "bhImgAirplane")
    
    func configure(with image: UIImage) {
        popularCityImageView.image = image
    }
    
}
