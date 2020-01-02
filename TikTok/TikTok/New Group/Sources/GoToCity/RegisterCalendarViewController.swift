//
//  RegisterCalendarViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

protocol RegisterCalendarViewDelegate: class {
    func didSetDays(_ days: Int)
    func didSetDate(_ startDate: String, _ arrivedDate: String)
    //디리게이트 뷰컨 컨벤션 공부
}

class RegisterCalendarViewController: UIViewController {
    weak var delegate: RegisterCalendarViewDelegate?
    @IBOutlet weak var closedButton: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var arrivedLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var arrivedDatePicker: UIDatePicker!
    let dateformatter = DateFormatter()
    var startDate: String = ""
    var arrivedDate: String = ""
    var days = 0
    //  var arrived: Date
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpClosedButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changedStartDatePicker(_ sender: Any) {
        
        dateformatter.dateStyle = .short
        dateformatter.dateFormat = "yyyy.MM.dd"
        startDate = dateformatter.string(from: startDatePicker.date)
        
        
        
        
        startLabel.text = startDate
        
    }
    
    @IBAction func changedArrivedDatePicker(_ sender: Any) {
        
        dateformatter.dateStyle = .short
        dateformatter.dateFormat = "yyyy.MM.dd"
        arrivedDate = dateformatter.string(from: arrivedDatePicker.date)
        print(arrivedDate)
        
        //   print(arrivedDate)
        arrivedLabel.text = arrivedDate
        
        //let endDate = dateformatter.date(from: arrivedDate)!
        
        
        
        // var interval = endDate.timeIntervalSince(arrived)
        
        //작업해야할 부분
        // let timeDurance = Date()
        
        
        
        
        // let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let startDate55 = dateformatter.date(from:startDate) else {
            return
        }
        let endDate = dateformatter.date(from:arrivedDate)!
        
        let interval = endDate.timeIntervalSince(startDate55)
        let days = Int(interval / 86400)
        //days에 플러스 써서 더해버리면, 데이트피커 돌릴때마다 더 해짐 뷰 뒤로갈때 +1 해주면됨 !!
        print("\(days+1) 기간.")
        self.days = days
        
    }
    
    @IBAction func touchUpComplete(_ sender: Any) {
        delegate?.didSetDays(days)
        delegate?.didSetDate(startLabel.text!, arrivedLabel.text!)
        
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

