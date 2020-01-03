//
//  CalculateHistoryViewController.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/03.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class CalculateHistoryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UIImageView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    
    @IBOutlet weak var stayButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var transportButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    
    
    var checkUpDown : Bool = false
    var buttonActiveStatus : [Int] = [0, 0, 0, 0, 0, 0] // 숙박 식사 간식 교통 쇼핑 액티비티
    var canChangeButton : Bool = true
    var activedButtonIdx : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    deinit{
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    func hideKeyboard(){
        priceTextField.resignFirstResponder()
        detailTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification){
        print("Keyboard will show : \(notification.name.rawValue)")
        view.frame.origin.y = -250
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

    
    @IBAction func clickStayButton(_ sender: Any) {
        print(buttonActiveStatus)
        if canChangeButton == true{
            stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
            canChangeButton = false
            buttonActiveStatus[0] = 1
        }
        else{
            var i = 0
            for i in 0..<buttonActiveStatus.count{
                if buttonActiveStatus[i] == 1{
                    activedButtonIdx = i
                    buttonActiveStatus[i] = 0
                }
            }
            if activedButtonIdx == 0{//숙박
                stayButton.setImage(UIImage(named: "inputBtnStay"), for: .normal)
                //파란색이 버튼 바꾸고
                stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
                buttonActiveStatus[0] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 1{//식사
                foodButton.setImage(UIImage(named: "inputBtnFood"), for: .normal)
                //파란색이 버튼 바꾸고
                stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
                buttonActiveStatus[0] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 2{//간식
                drinkButton.setImage(UIImage(named: "inputBtnSnacks"), for: .normal)
                //파란색이 버튼 바꾸고
                stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
                               //지금 버튼을 파란색으로 만든다
                buttonActiveStatus[0] = 1
            }
            if activedButtonIdx == 3{//교통
                transportButton.setImage(UIImage(named: "inputBtnTraffic"), for: .normal)
                //파란색이 버튼 바꾸고
                stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
                //지금 버튼을 파란색으로 만든다
                buttonActiveStatus[0] = 1
            }
            if activedButtonIdx == 4{//쇼핑
                shoppingButton.setImage(UIImage(named: "inputBtnShopping"), for: .normal)
                //파란색이 버튼 바꾸고
                stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
                //지금 버튼을 파란색으로 만든다
                buttonActiveStatus[0] = 1
            }
            if activedButtonIdx == 5{//액티비티
                activityButton.setImage(UIImage(named: "inputBtnActivity"), for: .normal)
                //파란색이 버튼 바꾸고
                stayButton.setImage(UIImage(named: "inputBtnStayActive"), for: .normal)
                //지금 버튼을 파란색으로 만든다
                buttonActiveStatus[0] = 1
            }
        }
        print(buttonActiveStatus)
    }
    
    @IBAction func clickFoodButton(_ sender: Any) {
        print(buttonActiveStatus)
        if canChangeButton == true{
            foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
            canChangeButton = false
            buttonActiveStatus[1] = 1
        }
        else{
            var i = 0
            for i in 0..<buttonActiveStatus.count{
                if buttonActiveStatus[i] == 1{
                    activedButtonIdx = i
                    buttonActiveStatus[i] = 0
                }
            }
            if activedButtonIdx == 0{//숙박
                stayButton.setImage(UIImage(named: "inputBtnStay"), for: .normal)
                //파란색이 버튼 바꾸고
                foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
                buttonActiveStatus[1] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 1{//식사
                foodButton.setImage(UIImage(named: "inputBtnFood"), for: .normal)
                //파란색이 버튼 바꾸고
                foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
                buttonActiveStatus[1] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 2{//간식
                drinkButton.setImage(UIImage(named: "inputBtnSnacks"), for: .normal)
                //파란색이 버튼 바꾸고
                foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
                buttonActiveStatus[1] = 1
                               //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 3{//교통
                transportButton.setImage(UIImage(named: "inputBtnTraffic"), for: .normal)
                //파란색이 버튼 바꾸고
                foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
                buttonActiveStatus[1] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 4{//쇼핑
                shoppingButton.setImage(UIImage(named: "inputBtnShopping"), for: .normal)
                //파란색이 버튼 바꾸고
                foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
                buttonActiveStatus[1] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 5{//액티비티
                activityButton.setImage(UIImage(named: "inputBtnActivity"), for: .normal)
                //파란색이 버튼 바꾸고
                foodButton.setImage(UIImage(named: "inputBtnFoodActive"), for: .normal)
                buttonActiveStatus[1] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
        }
        print(buttonActiveStatus)
    }
    
    @IBAction func clickDrinkButton(_ sender: Any) {
        print(buttonActiveStatus)
        if canChangeButton == true{
            drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
            canChangeButton = false
            buttonActiveStatus[2] = 1
        }
        else{
            var i = 0
            for i in 0..<buttonActiveStatus.count{
                if buttonActiveStatus[i] == 1{
                    activedButtonIdx = i
                    buttonActiveStatus[i] = 0
                }
            }
            if activedButtonIdx == 0{//숙박
                stayButton.setImage(UIImage(named: "inputBtnStay"), for: .normal)
                //파란색이 버튼 바꾸고
                drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
                buttonActiveStatus[2] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 1{//식사
                foodButton.setImage(UIImage(named: "inputBtnFood"), for: .normal)
                //파란색이 버튼 바꾸고
                drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
                buttonActiveStatus[2] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 2{//간식
                drinkButton.setImage(UIImage(named: "inputBtnDrink"), for: .normal)
                //파란색이 버튼 바꾸고
                drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
                buttonActiveStatus[2] = 1
                               //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 3{//교통
                transportButton.setImage(UIImage(named: "inputBtnTraffic"), for: .normal)
                //파란색이 버튼 바꾸고
                drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
                buttonActiveStatus[2] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 4{//쇼핑
                shoppingButton.setImage(UIImage(named: "inputBtnShopping"), for: .normal)
                //파란색이 버튼 바꾸고
                drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
                buttonActiveStatus[2] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 5{//액티비티
                activityButton.setImage(UIImage(named: "inputBtnActivity"), for: .normal)
                //파란색이 버튼 바꾸고
                drinkButton.setImage(UIImage(named: "inputBtnSnacksActive"), for: .normal)
                buttonActiveStatus[2] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
        }
        print(buttonActiveStatus)
    }
    
    @IBAction func clickTransportButton(_ sender: Any) {
        print(buttonActiveStatus)
        if canChangeButton == true{
            transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
            canChangeButton = false
            buttonActiveStatus[3] = 1
        }
        else{
            var i = 0
            for i in 0..<buttonActiveStatus.count{
                if buttonActiveStatus[i] == 1{
                    activedButtonIdx = i
                    buttonActiveStatus[i] = 0
                }
            }
            if activedButtonIdx == 0{//숙박
                stayButton.setImage(UIImage(named: "inputBtnStay"), for: .normal)
                //파란색이 버튼 바꾸고
                transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
                buttonActiveStatus[3] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 1{//식사
                foodButton.setImage(UIImage(named: "inputBtnFood"), for: .normal)
                //파란색이 버튼 바꾸고
                transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
                buttonActiveStatus[3] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 2{//간식
                drinkButton.setImage(UIImage(named: "inputBtnSnacks"), for: .normal)
                //파란색이 버튼 바꾸고
                transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
                buttonActiveStatus[3] = 1
                               //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 3{//교통
                transportButton.setImage(UIImage(named: "inputBtnTraffic"), for: .normal)
                //파란색이 버튼 바꾸고
                transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
                buttonActiveStatus[3] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 4{//쇼핑
                shoppingButton.setImage(UIImage(named: "inputBtnShopping"), for: .normal)
                //파란색이 버튼 바꾸고
                transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
                buttonActiveStatus[3] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 5{//액티비티
                activityButton.setImage(UIImage(named: "inputBtnActivity"), for: .normal)
                //파란색이 버튼 바꾸고
                transportButton.setImage(UIImage(named: "inputBtnTrafficActive"), for: .normal)
                buttonActiveStatus[3] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
        }
        print(buttonActiveStatus)
    }

    @IBAction func clickShoppingButton(_ sender: Any) {
        print(buttonActiveStatus)
        if canChangeButton == true{
            shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
            canChangeButton = false
            buttonActiveStatus[4] = 1
            print("***")
        }
        else{
            
            for i in 0..<buttonActiveStatus.count{
                if buttonActiveStatus[i] == 1{
                    activedButtonIdx = i
                    buttonActiveStatus[i] = 0
                    print(activedButtonIdx)
                    print(buttonActiveStatus[i])
                }
            }
            if activedButtonIdx == 0{//숙박
                stayButton.setImage(UIImage(named: "inputBtnStay"), for: .normal)
                //파란색이 버튼 바꾸고
                shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
                buttonActiveStatus[4] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 1{//식사
                foodButton.setImage(UIImage(named: "inputBtnFood"), for: .normal)
                //파란색이 버튼 바꾸고
                shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
                buttonActiveStatus[4] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 2{//간식
                drinkButton.setImage(UIImage(named: "inputBtnSnacks"), for: .normal)
                //파란색이 버튼 바꾸고
                shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
                buttonActiveStatus[4] = 1
                               //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 3{//교통
                transportButton.setImage(UIImage(named: "inputBtnTraffic"), for: .normal)
                //파란색이 버튼 바꾸고
                shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
                buttonActiveStatus[4] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 4{//쇼핑
                shoppingButton.setImage(UIImage(named: "inputBtnShopping"), for: .normal)
                //파란색이 버튼 바꾸고
                shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
                buttonActiveStatus[4] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 5{//액티비티
                activityButton.setImage(UIImage(named: "inputBtnActivity"), for: .normal)
                //파란색이 버튼 바꾸고
                shoppingButton.setImage(UIImage(named: "inputBtnShoppingActive"), for: .normal)
                buttonActiveStatus[4] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
        }
        print(buttonActiveStatus)
    }
    
    @IBAction func clickActivityButton(_ sender: Any) {
        print(buttonActiveStatus)
        if canChangeButton == true{
            activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
            canChangeButton = false
            buttonActiveStatus[5] = 1
        }
        else{
            var i = 0
            for i in 0..<buttonActiveStatus.count{
                if buttonActiveStatus[i] == 1{
                    activedButtonIdx = i
                    buttonActiveStatus[i] = 0
                }
            }
            if activedButtonIdx == 0{//숙박
                stayButton.setImage(UIImage(named: "inputBtnStay"), for: .normal)
                //파란색이 버튼 바꾸고
                activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
                buttonActiveStatus[5] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 1{//식사
                foodButton.setImage(UIImage(named: "inputBtnFood"), for: .normal)
                //파란색이 버튼 바꾸고
                activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
                buttonActiveStatus[5] = 1
                //지금 버튼을 파란색으로 만든다
            }
            if activedButtonIdx == 2{//간식
                drinkButton.setImage(UIImage(named: "inputBtnSnacks"), for: .normal)
                //파란색이 버튼 바꾸고
                activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
                buttonActiveStatus[5] = 1
                               //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 3{//교통
                transportButton.setImage(UIImage(named: "inputBtnTraffic"), for: .normal)
                //파란색이 버튼 바꾸고
               activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
                buttonActiveStatus[5] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 4{//쇼핑
                shoppingButton.setImage(UIImage(named: "inputBtnShopping"), for: .normal)
                //파란색이 버튼 바꾸고
                activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
                buttonActiveStatus[5] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
            if activedButtonIdx == 5{//액티비티
                activityButton.setImage(UIImage(named: "inputBtnActivity"), for: .normal)
                //파란색이 버튼 바꾸고
                activityButton.setImage(UIImage(named: "inputBtnActivityActive"), for: .normal)
                buttonActiveStatus[5] = 1
                //지금 버튼을 파란색으로 만든다
                
            }
        }
        print(buttonActiveStatus)
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func goToNext(_ sender: Any) {
        hideKeyboard()

        
        guard let priceOfPay = Int(priceTextField.text!) else{
           print("1번쨰")
            view.frame.origin.y = 0
            checkUpDown = false
            return
        }
        guard let priceOfDetail = Int(detailTextField.text!) else{
            print("2번쨰")
            view.frame.origin.y = 0
            checkUpDown = false
            return
        }
        
        print("checkUpDown = \(checkUpDown)")
        if checkUpDown == true{
            view.frame.origin.y = 0
            checkUpDown = false
        }
        
        if view.frame.origin.y == 0{
            print("넘어간다")
        }else{
            view.frame.origin.y = 0
            print("안넘어간다")
        }
            
        
        //다음 뷰로 이동

        
    }
    
    
    
    
}
