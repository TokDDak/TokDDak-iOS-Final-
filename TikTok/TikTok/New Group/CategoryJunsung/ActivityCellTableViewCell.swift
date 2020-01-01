//
//  ActivityCellTableViewCell.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class ActivityCellTableViewCell: UITableViewCell {

    @IBOutlet weak var aImage: UIImageView!
    @IBOutlet weak var aName: UIButton!
    @IBOutlet weak var aPrice: UILabel!
    @IBOutlet weak var aSelect: UIButton!
      
    override func prepareForReuse()
    {
        super.prepareForReuse()
        // Reset the cell for new row's data
//        self.aSelect.setImage(UIImage(named: "btnSelect"), for: .normal)
      //  self.aSelect.setImage(UIImage(named: "btnSelect"), for: .normal)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    @IBAction func selectActivity(_ sender: Any) {
//        if aSelect.image(for: .normal) == UIImage(named: "btnSelectActive"){
//            aSelect.setImage(UIImage(named: "btnSelect"), for: .normal)
//        }
//        else{
//            aSelect.setImage(UIImage(named: "btnSelectActive"), for: .normal)
//        }
//    }
    
}
