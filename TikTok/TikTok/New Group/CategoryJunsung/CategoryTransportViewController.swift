//
//  CategoryTransportViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class CategoryTransportViewController: UIViewController {
    
    var selectedCategoryData : [Int] = []
    var progressBarOffset : Int = 1
    var pgValue : Int = 0
    

    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        
        
        print(progressBarOffset)
        progressBar.progress = Float(progressBarOffset) * (Float(1.0 / Double(pgValue)))
        let yourBackImage = UIImage(named: "naviBtnBackB")
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
    
    
    
    
    @IBAction func nextCategory(_ sender: Any) {
        hideKeyboard()
        let tmp = Int(textField.text!)
        totalPrice.text = String(tmp!.commaRepresentation)
        
        
        
        if selectedCategoryData.count == 0{
            //go to next category flow
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
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 5{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "ActivityCellViewController") as! ActivityCellViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                
                
            }
        }
        
    }
   
    
    
}
