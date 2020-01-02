//
//  ActivityPopUpViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/31.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit


class ActivityPopUpViewController: UIViewController {
    
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityDetail: UITextView!
    @IBOutlet weak var goToMRT: UIButton!
    @IBOutlet weak var goToKlook: UIButton!
    
    

    var priceOfActivity : Int = 0
    var nameOfActivity : String = ""
    var detailOfActivity : String = ""
    var mrtURL: URL?
    var klURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityPrice.text = String(priceOfActivity.commaRepresentation) + " ₩"
        activityName.text = nameOfActivity
        activityDetail.text = detailOfActivity
        /*행간 조절 부분*/
        let attrString = NSMutableAttributedString(string: activityDetail.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 15
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        activityDetail.attributedText = attrString
        
       /*border에 테두리 주기*/
        self.middleView.layer.addBorder([.bottom, .top], color: UIColor.gray , width: 0.5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToMRT(_ sender: UIButton) {
        if let url = mrtURL {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func goToKlook(_ sender: UIButton) {
        if let url = klURL {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
