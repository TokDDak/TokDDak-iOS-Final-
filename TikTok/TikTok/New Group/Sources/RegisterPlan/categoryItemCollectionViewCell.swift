//
//  categoryItemCollectionViewCell.swift
//  TikTok
//
//  Created by IJ . on 2020/01/01.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class categoryItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //itemLabel.sizeToFit()
        self.contentView.layer.cornerRadius = 18
    }
    
    
}
