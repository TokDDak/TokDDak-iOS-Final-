//
//  GoToCityViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit


class GoToCityViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var RegisterCalendarButton: UIButton!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var arrivedDateLabel: UILabel!
    
    @IBOutlet weak var travelNameTextField: UITextField!
    
    var cityName: String = ""
    var arrivedDate: String = ""
    var startDate: String = ""
    var days: Int = 0
  
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameLabel.text = TotalPlanData.shared.cityName
        
        self.arrivedDateLabel.text = arrivedDate
        self.startDateLabel.text = startDate
        
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let yourBackImage = UIImage(named: "naviBtnBackB")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        
        let tapGesture: UITapGestureRecognizer =
            UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        //키보드 내리기위해 TapGestureRecognizer
        
        
        
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
    
    
    @IBAction func editTravelName(_ sender: UITextField) {
        TotalPlanData.shared.travelName = travelNameTextField.text ?? ""
    }
    
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
      self.view.endEditing(true)
      return true
  }
    
    
    
}

extension GoToCityViewController: RegisterCalendarViewDelegate {
    func didSetDays(_ days: Int) {
        self.days = days
        
        TotalPlanData.shared.travelDays = days + 1
        
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
        
        TotalPlanData.shared.startDate = startDate
        TotalPlanData.shared.endDate = arrivedDate
        
        
        
        print(TotalPlanData.shared)
        
    }
}
//
//extension GoToCityViewController {
//    func dismissKey()
//    {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(GoToCityViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//    @objc func dismissKeyboard()
//    {
//        view.endEditing(true)
//    }
//}

