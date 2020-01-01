//
//  GoToCityViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class GoToCityViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var RegisterCalendarButton: UIButton!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var arrivedDateLabel: UILabel!
    
    @IBOutlet weak var travelNameTextField: UITextField!
    
    
    var arrivedDate: String = ""
    var startDate: String = ""
    
    var days: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameLabel.text = TravelData.userChooseCity
        self.arrivedDateLabel.text = arrivedDate
        self.startDateLabel.text = startDate
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpBackButton(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpRegisterButton(_ sender: Any) {
    
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterCalendarViewController
            else {
                return
        }
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
    
}

extension GoToCityViewController: RegisterCalendarViewDelegate {
    func didSetDays(_ days: Int) {
        self.days = days
        print("저 데이터 왔어유 \(days)")
    }
    
    func didSetDate(_ startDate: String, _ arrivedDate: String){
        self.startDate = startDate
        self.arrivedDate = arrivedDate
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        self.arrivedDateLabel.text = arrivedDate
        //arrivedDate
        self.startDateLabel.text = startDate
    }
}
