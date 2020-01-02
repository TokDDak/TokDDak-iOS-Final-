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
    
    let hotelCost = TotalPlanData.shared.totalCostOfHotel.reduce(0){$0 + $1.value}
    let foodCost =
        TotalPlanData.shared.totalCostOfFood.reduce(0){$0 + $1.value}
    let activityCost =
        TotalPlanData.shared.totalCostOfActivity
        
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        costOfHotel.text = String(TotalPlanData.shared.totalCostOfHotel.reduce(0){$0 + $1.value}.commaRepresentation)
        costOfFood.text = String(TotalPlanData.shared.totalCostOfFood.reduce(0){$0 + $1.value}.commaRepresentation)
        costOfDrink.text = String(TotalPlanData.shared.totalCostOfDrink.reduce(0){$0 + $1.value}.commaRepresentation)
        costOfTransport.text = String(totalCostOfTransport.commaRepresentation)
        costOfShopping.text = String(totalCostOfShopping.commaRepresentation)
        costOfActivity.text = String(TotalPlanData.shared.totalCostOfActivity.commaRepresentation)
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
        
    }
    
    
}
