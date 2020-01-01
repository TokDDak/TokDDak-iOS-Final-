//
//  ChildViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/28.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ChildViewController: UIViewController, IndicatorInfoProvider {
    var childNumber: String = ""
    
    @IBOutlet weak var popularCityImageView: UIImageView!
    @IBOutlet weak var child: UILabel!
    @IBOutlet weak var popularTableView: UITableView!
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
         return IndicatorInfo(title: "\(childNumber)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

      
        
        // Do any additional setup after loading the view.
    }
    

  

}
