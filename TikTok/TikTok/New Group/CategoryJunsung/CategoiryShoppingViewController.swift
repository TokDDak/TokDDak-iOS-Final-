//
//  CategoiryShoppingViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class CategoiryShoppingViewController: UIViewController, UITextFieldDelegate {
    
    var selectedCategoryData : [Int] = []
    var progressBarOffset : Int = 1
    var pgValue : Int = 0
    var masterTotalPrice : Int = 0
    var priceOfShopping : Int = 0
    
    var checkUpDown = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var completeBttn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
      masterTotalPrice -= totalCostOfShopping
      totalPrice.text = String(masterTotalPrice.commaRepresentation)
      totalCostOfShopping = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*custom view shadow 만들기*/
        //self.middleView.layer.addBorder([.bottom, .top], color: UIColor.gray , width: 0.5)
        totalPrice.text = String(masterTotalPrice.commaRepresentation)
        textField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
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
        textField.textColor = UIColor.black
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
        
       guard let priceOfShopping = Int(textField.text!)
        else{
            view.frame.origin.y = 0
            return
        }
        
        totalCostOfShopping = priceOfShopping

        
        if checkUpDown == 1{
               let tmp = masterTotalPrice + priceOfShopping
               view.frame.origin.y = 0
               totalPrice.text = String(tmp.commaRepresentation)
           }
         
        if checkUpDown == 0{
            masterTotalPrice += priceOfShopping
            totalPrice.text = String(masterTotalPrice.commaRepresentation)
            if selectedCategoryData.count == 0{
                //go to next category flow
                let vc = storyboard?.instantiateViewController(withIdentifier: "totalBudgetViewController") as! totalBudgetViewController
                 
                 self.navigationController?.pushViewController(vc, animated: true)
            }
            if selectedCategoryData.count > 0 {
                if let nextCategory = selectedCategoryData.first{
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
        //view.frame.origin.y = +250
        //넘어갈 때 초기화
//        textField.text = ""
        checkUpDown = 0
    }
    
    
}
