//
//  TravelingViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/27.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class TravelingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpTravelBefore(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func touchUpTest(_ sender: Any) {
        
        print(TravelData.userChooseCity)
        
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
