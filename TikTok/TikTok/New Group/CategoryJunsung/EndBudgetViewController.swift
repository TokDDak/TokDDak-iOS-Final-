//
//  EndBudgetViewController.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/04.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class EndBudgetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        let yourBackImage = UIImage(named: "")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        /*navaigation 이름 변경*/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        /*navaigation border 삭제*/
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }
    @IBAction func endBudget(_ sender: Any) {
        //        self.view.removeFromSuperview()
    }
    
    
}
