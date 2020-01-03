//
//  ActivityCellTableViewCell.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

protocol ActivityCellTableViewCellDelegate: class {
    func activityCell(_ cell: ActivityCellTableViewCell, didTapNameButton button: UIButton)
    func activityCell(_ cell: ActivityCellTableViewCell, didTapSelectButton button: UIButton)
}

class ActivityCellTableViewCell: UITableViewCell {
    weak var delegate: ActivityCellTableViewCellDelegate?
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
      
    override func prepareForReuse() {
        super.prepareForReuse()
        activityImageView.image = nil
        nameButton.setTitle(nil, for: .normal)
        priceLabel.text = nil
        selectButton.setTitle(nil, for: .normal)
        selectButton.setImage(nil, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.borderWidth = 2
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.borderColor = CGColor.init(srgbRed: 255, green: 255, blue: 255, alpha: 100)
        nameButton.addTarget(self, action: #selector(nameButtonDidTap(_:)), for: .touchUpInside)
        selectButton.addTarget(self, action: #selector(selectButtonDidTap(_:)), for: .touchUpInside)
    }
    
    func configure(with model: ActivityCellModel, tag: Int, isSelected: Bool) {
        let selectButtonImage = isSelected ? UIImage(named: "btnSelectActive") : UIImage(named: "btnSelect")
        selectButton.setImage(selectButtonImage, for: .normal)
        nameButton.setTitle(model.name, for: .normal)
        priceLabel.text = "\(model.cost.commaRepresentation) 원"
        ImageFetcher.image(for: URL(string: model.image)!) { result in
            switch result {
            case let .success(image):
                DispatchQueue.main.async {
                    self.activityImageView.image = image
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        nameButton.tag = tag
        selectButton.tag = tag
    }
    
    @objc private func nameButtonDidTap(_ sender: UIButton) {
        delegate?.activityCell(self, didTapNameButton: sender)
    }
    
    @objc private func selectButtonDidTap(_ sender: UIButton) {
        delegate?.activityCell(self, didTapSelectButton: sender)
    }
}
