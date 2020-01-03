//
//  CategoryTransportViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit



//교통 가격
var totalCostOfTransport : Int = 0
//쇼핑 가격
var totalCostOfShopping : Int = 0

class CategoryTransportViewController: UIViewController {
    
    var selectedCategoryData : [Int] = []
    var progressBarOffset : Int = 1
    var pgValue : Int = 0
    var priceOfTransport : Int = 0
    var masterTotalPrice : Int = 0
    //주석
    
    var checkUpDown = 0
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var completeBttn: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        masterTotalPrice -= totalCostOfTransport
        totalPrice.text = String(masterTotalPrice.commaRepresentation)
        totalCostOfTransport = 0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPrice.text = String(masterTotalPrice.commaRepresentation)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        
        
        print(progressBarOffset)
        progressBar.progress = Float(progressBarOffset) * (Float(1.0 / Double(pgValue)))
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
    
    deinit{
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    func hideKeyboard(){
        textField.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification){
        print("Keyboard will show : \(notification.name.rawValue)")
        view.frame.origin.y = -250
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    @IBAction func checkInt(_ sender: Any) {
        if textField.text == nil{
            completeBttn.isEnabled = false
        }
        else{
            completeBttn.isEnabled = true
        }
        checkUpDown = 1
    }
    
    
    
    @IBAction func nextCategory(_ sender: Any) {
        hideKeyboard()

        
        guard let priceOfTransport = Int(textField.text!) else{
            view.frame.origin.y = 0
            return
        }
        
        totalCostOfTransport = priceOfTransport
        
        if checkUpDown == 1{
            let tmp = masterTotalPrice + priceOfTransport
            view.frame.origin.y = 0
            totalPrice.text = String(tmp.commaRepresentation)
          }
        
        if checkUpDown == 0{
            masterTotalPrice += priceOfTransport
            totalPrice.text = String(masterTotalPrice.commaRepresentation)
            if selectedCategoryData.count == 0{
                //go to next category flow
                let vc = storyboard?.instantiateViewController(withIdentifier: "totalBudgetViewController") as! totalBudgetViewController
                 
                 self.navigationController?.pushViewController(vc, animated: true)
            }
            if selectedCategoryData.count > 0 {
                if let nextCategory = selectedCategoryData.first{
                    if nextCategory == 4{
                        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoiryShoppingViewController") as! CategoiryShoppingViewController
                        var tmpSelectedCategory = selectedCategoryData
                        tmpSelectedCategory.remove(at: 0)
                        vc.selectedCategoryData = tmpSelectedCategory
                        vc.progressBarOffset = progressBarOffset + 1
                        vc.pgValue = pgValue
                        vc.masterTotalPrice = masterTotalPrice
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    }
                    
                    if nextCategory == 5{
                        let vc = storyboard?.instantiateViewController(withIdentifier: "ActivityCellViewController") as! ActivityCellViewController
                        var tmpSelectedCategory = selectedCategoryData
                        tmpSelectedCategory.remove(at: 0)
                        vc.selectedCategoryData = tmpSelectedCategory
                        vc.progressBarOffset = progressBarOffset + 1
                        vc.pgValue = pgValue
                        vc.basePriceOfActivity = masterTotalPrice
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                    
                    
                }
            }
            textField.text = ""
        }
        checkUpDown = 0
    }
    
    
}

