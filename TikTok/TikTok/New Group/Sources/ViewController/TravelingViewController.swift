//
//  TravelingViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/27.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class TravelingViewController: UIViewController {
    
    @IBOutlet weak var gurumiView: UIView!
    @IBOutlet weak var backGroundCloudImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.sendSubviewToBack(self.backGroundCloudImageView)
        self.gurumiView.backgroundColor = UIColor(patternImage: UIImage(named: "imgHomeIngCard")!)
        //뷰 맨뒤로
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpTravelBefore(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: false)
        
        
        
        
    }
    
    
    
    
}
