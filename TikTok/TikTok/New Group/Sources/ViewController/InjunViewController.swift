//
//  InjunViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class InjunViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchPopUp(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "InjunStoryboard", bundle: nil)
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopUpViewController")
        popupVC.modalPresentationStyle = .overCurrentContext
        present(popupVC, animated: true, completion: nil)
        
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
