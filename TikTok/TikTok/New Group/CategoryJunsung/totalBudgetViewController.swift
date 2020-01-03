//
//  totalBudgetViewController.swift
//  TikTok
//
//  Created by 김준성 on 2020/01/03.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class totalBudgetViewController: UIViewController {

    @IBOutlet weak var travelTotalBudget: UILabel!
    
    @IBOutlet weak var costOfHotel: UILabel!
    @IBOutlet weak var costOfFood: UILabel!
    @IBOutlet weak var costOfDrink: UILabel!
    @IBOutlet weak var costOfTransport: UILabel!
    @IBOutlet weak var costOfShopping: UILabel!
    @IBOutlet weak var costOfActivity: UILabel!
    @IBOutlet weak var travelDate: UILabel!
    
    @IBOutlet weak var hotelLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    
    @IBOutlet weak var wonOfHotel: UILabel!
    @IBOutlet weak var wonOfFood: UILabel!
    @IBOutlet weak var wonOfDrink: UILabel!
    @IBOutlet weak var wonOfTransport: UILabel!
    @IBOutlet weak var wonOfShopping: UILabel!
    @IBOutlet weak var wonOfActivity: UILabel!
    
    
    
    
    
    
    let hotelCost = TotalPlanData.shared.totalCostOfHotel.reduce(0){$0 + $1.value}
    let foodCost =
        TotalPlanData.shared.totalCostOfFood.reduce(0){$0 + $1.value}
    let drinkCost = TotalPlanData.shared.totalCostOfDrink.reduce(0){$0 + $1.value}
    let activityCost =
        TotalPlanData.shared.totalCostOfActivity
        
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let yourBackImage = UIImage(named: "naviBtnBackBlack")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        /*navaigation 이름 변경*/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        /*navaigation border 삭제*/
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        (costOfHotel.textColor, hotelLabel.textColor, wonOfHotel.textColor) = hotelCost == 0 ? (UIColor.gray, UIColor.gray,UIColor.gray) : (UIColor.black, UIColor.black, UIColor.black)
        (costOfFood.textColor, foodLabel.textColor, wonOfFood.textColor) = foodCost == 0 ? (UIColor.gray, UIColor.gray,UIColor.gray) : (UIColor.black, UIColor.black,UIColor.black)
         (costOfDrink.textColor, drinkLabel.textColor, wonOfDrink.textColor) = drinkCost == 0 ? (UIColor.gray, UIColor.gray,UIColor.gray) : (UIColor.black, UIColor.black,UIColor.black)
         (costOfTransport.textColor, transportLabel.textColor, wonOfTransport.textColor) = totalCostOfTransport == 0 ? (UIColor.gray, UIColor.gray,UIColor.gray) : (UIColor.black, UIColor.black,UIColor.black)
         (costOfShopping.textColor, shoppingLabel.textColor, wonOfShopping.textColor) = totalCostOfShopping == 0 ? (UIColor.gray, UIColor.gray,UIColor.gray) : (UIColor.black, UIColor.black,UIColor.black)
         (costOfActivity.textColor, activityLabel.textColor, wonOfActivity.textColor) = activityCost == 0 ? (UIColor.gray, UIColor.gray,UIColor.gray) : (UIColor.black, UIColor.black,UIColor.black)

        
        costOfHotel.text = String(hotelCost.commaRepresentation)
        
        costOfFood.text = String(foodCost.commaRepresentation)
        costOfDrink.text = String(drinkCost.commaRepresentation)
        costOfTransport.text = String(totalCostOfTransport.commaRepresentation)
        costOfShopping.text = String(totalCostOfShopping.commaRepresentation)
        costOfActivity.text = String(activityCost.commaRepresentation)
        
        travelDate.text = "\(TotalPlanData.shared.startDate) - \(TotalPlanData.shared.endDate)"
        
        let budgetOftotal =  (hotelCost + foodCost + activityCost + totalCostOfShopping + totalCostOfShopping)
        travelTotalBudget.text = String(budgetOftotal.commaRepresentation)
        
        costOfActivity.sizeToFit()
        costOfFood.sizeToFit()
        costOfDrink.sizeToFit()
        costOfTransport.sizeToFit()
        costOfShopping.sizeToFit()
        costOfActivity.sizeToFit()
        travelDate.sizeToFit()
        travelTotalBudget.sizeToFit()
    }

    @IBAction func goToNext(_ sender: Any) {
   
            //print(menuCnt)
//            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//            let popupVC = storyBoard.instantiateViewController(withIdentifier: "EndBudgetViewController")
//            popupVC.modalPresentationStyle = .overCurrentContext
//            present(popupVC, animated: true, completion: nil)
}
}
