//
//  CityChooseSection.swift
//  TikTok
//
//  Created by IJ . on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

protocol CityChooseSectionDelegate: class {
    func cityChooseSection(_ view: UIView, didSelectButton button: UIButton)
}

class CityChooseSection: UIView {
    weak var delegate: CityChooseSectionDelegate?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foldButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foldButton.addTarget(self, action: #selector(touchUpFoldButton(_:)), for: .touchUpInside)
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    @objc private func touchUpFoldButton(_ sender: UIButton) {
        delegate?.cityChooseSection(self, didSelectButton: sender)
    }
}
