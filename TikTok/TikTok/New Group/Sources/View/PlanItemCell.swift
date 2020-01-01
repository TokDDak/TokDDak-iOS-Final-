//
//  PlanItemCell.swift
//  TikTok
//
//  Created by IJ . on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

final class PlanItemCell: UITableViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.clipsToBounds = true
        colorView.layer.cornerRadius = 3
    }
    
    func configure(with planItem: PlanItem) {
        itemLabel.text = planItem.title
        colorView.backgroundColor = planItem.planType.color
    }
}
