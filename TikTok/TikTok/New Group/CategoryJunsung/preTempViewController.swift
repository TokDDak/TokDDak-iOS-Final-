//
//  preTempViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/28.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class preTempViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let nav = self.navigationController?.navigationBar
//
//                   // 2
//                   nav?.barStyle = UIBarStyle.default
//                   nav?.tintColor = UIColor.blue
    /*navaigation 이미지 변경*/
//      self.navigationController?.isNavigationBarHidden = false
        
    let yourBackImage = UIImage(named: "naviBtnBackBlack")
    self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
    self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    /*navaigation 이름 변경*/
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    /*navaigation border 삭제*/
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    self.navigationController?.isNavigationBarHidden = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
