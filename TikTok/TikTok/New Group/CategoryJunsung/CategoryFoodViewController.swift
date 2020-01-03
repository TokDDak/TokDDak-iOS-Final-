//
//  CategoryFoodViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import Alamofire
typealias FoodModel = _FoodResponseModel.Result
class CategoryFoodViewController: UIViewController {
    
    var selectedCategoryData : [Int] = []
    var progressBarOffset : Int = 1
    var pgValue : Int = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var highMinusBttn: UIButton!
    @IBOutlet weak var highPlusBttn: UIButton!
    @IBOutlet weak var middleMinusBttn: UIButton!
    @IBOutlet weak var middlePlusBttn: UIButton!
    @IBOutlet weak var lowMinusBttn: UIButton!
    @IBOutlet weak var lowPlusBttn: UIButton!
    @IBOutlet weak var numOfHigh: UILabel!
    @IBOutlet weak var numOfMiddle: UILabel!
    @IBOutlet weak var numOfLow: UILabel!
    @IBOutlet weak var priceOfHigh: UILabel!
    @IBOutlet weak var priceOfMiddle: UILabel!
    @IBOutlet weak var priceOfLow: UILabel!
    
    @IBOutlet weak var avgPriceOfHigh: UILabel!
    @IBOutlet weak var avgPriceOfMiddle: UILabel!
    @IBOutlet weak var avgPriceOfLow: UILabel!
    @IBOutlet weak var completeBttn: UIButton!
    
    @IBOutlet weak var totalCountOfFood: UILabel!
    @IBOutlet weak var totalPriceOfFood: UILabel!
    
    @IBOutlet weak var highFoodImage: UIImageView!
    @IBOutlet weak var middleFoodImage: UIImageView!
    @IBOutlet weak var lowFoodImage: UIImageView!
    
    
    
    
    var eachPriceFood : [Int : Int] = [0:21000, 1:21000, 2:21000]
    var masterTotalPrice : Int = 0
    var model: FoodModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let cityID = 1
        APIService.shared.requestMedianFood(cityID: cityID){
            [weak self] result in
            guard let self = self else {return}
            switch result{
            case let .success(success):
                guard let data = success.data else {return}
                for i in 0...2{
                    let result = data.result[i]
                    self.model = result
                    self.reloadView(by: result, index: i)
                }
            case let .failure(error):
                print("실페")
                print(error.localizedDescription)
            }
        }
    }
    
    func reloadView(by model: FoodModel, index: Int){
        if index == 2{
            avgPriceOfHigh.text = "\(model.cost.commaRepresentation)원"//String(model.cost.commaRepresentation) + "원"
            eachPriceFood[0] = model.cost
            TotalPlanData.shared.invidCostOfFood[2] = model.cost
            //avgPriceOfHigh.sizeToFit()
        }
        if index == 1{
            avgPriceOfMiddle.text = String(model.cost.commaRepresentation) + "원"
            eachPriceFood[1] = model.cost
            //avgPriceOfHigh.sizeToFit()
            TotalPlanData.shared.invidCostOfFood[1] = model.cost
        }
        if index == 0{
            avgPriceOfLow.text = String(model.cost.commaRepresentation) + "원"
            eachPriceFood[2] = model.cost
            //avgPriceOfHigh.sizeToFit()
            TotalPlanData.shared.invidCostOfFood[0] = model.cost
        }
     
    }
    
    
    
    @IBAction func nextCategory(_ sender: Any) {
        if selectedCategoryData.count == 0{
            //go to next category flow
            let vc = storyboard?.instantiateViewController(withIdentifier: "totalBudgetViewController") as! totalBudgetViewController
             
             self.navigationController?.pushViewController(vc, animated: true)
        }
        if selectedCategoryData.count > 0 {
            if let nextCategory = selectedCategoryData.first{
                if nextCategory == 2{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryDrinkViewController") as! CategoryDrinkViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.masterTotalPrice = masterTotalPrice
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 3{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryTransportViewController") as! CategoryTransportViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.masterTotalPrice = masterTotalPrice
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
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
        
    }
    
    
    
    
    
    @IBAction func cafeMinus(_ sender: Any) {
        
        if TotalPlanData.shared.totalCountOfFood[0]! > 0{
            TotalPlanData.shared.totalCountOfFood[0]! -= 1
            guard let ep = eachPriceFood[0] else{return}
            guard let tc = TotalPlanData.shared.totalCountOfFood[0] else{return}
            TotalPlanData.shared.totalCostOfFood[0] = ep * tc
            guard let tp = TotalPlanData.shared.totalCostOfFood[0] else{return}
            
            priceOfHigh.text = String(tp.commaRepresentation) //+ "원"
            numOfHigh.text = String(tc)
            priceOfHigh.sizeToFit()
            //
            masterTotalPrice -= eachPriceFood[0]!
            totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
            totalCountOfFood.text = String(returnCount())
            totalPriceOfFood.sizeToFit()
            totalCountOfFood.sizeToFit()
            btthEnable()
        }
    }
    
    @IBAction func cafePlus(_ sender: Any) {
        TotalPlanData.shared.totalCountOfFood[0]! += 1
        TotalPlanData.shared.totalCostOfFood[0]! = (TotalPlanData.shared.totalCountOfFood[0]! * eachPriceFood[0]!)
        guard let tp = TotalPlanData.shared.totalCostOfFood[0] else{return}
        guard let tc = TotalPlanData.shared.totalCountOfFood[0] else{return}
        priceOfHigh.text = String(tp.commaRepresentation) //+ "원"
        numOfHigh.text = String(tc)
        priceOfHigh.sizeToFit()
        //
        masterTotalPrice += eachPriceFood[0]!
        totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
        totalCountOfFood.text = String(returnCount())
        totalPriceOfFood.sizeToFit()
        totalCountOfFood.sizeToFit()
        btthEnable()
    }
    
    @IBAction func desertMinus(_ sender: Any) {
        if TotalPlanData.shared.totalCountOfFood[1]! > 0{
            TotalPlanData.shared.totalCountOfFood[1]! -= 1
            guard let ep = eachPriceFood[1] else{return}
            guard let tc = TotalPlanData.shared.totalCountOfFood[1] else{return}
            TotalPlanData.shared.totalCostOfFood[1] = ep * tc
            guard let tp = TotalPlanData.shared.totalCostOfFood[1] else{return}
            
            priceOfMiddle.text = String(tp.commaRepresentation) //+ "원"
            numOfMiddle.text = String(tc)
            priceOfMiddle.sizeToFit()
            //
            masterTotalPrice -= eachPriceFood[1]!
            totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
            totalCountOfFood.text = String(returnCount())
            totalPriceOfFood.sizeToFit()
            totalCountOfFood.sizeToFit()
            btthEnable()
        }
    }
    
    @IBAction func desertPlus(_ sender: Any) {
        TotalPlanData.shared.totalCountOfFood[1]! += 1
        TotalPlanData.shared.totalCostOfFood[1]! = (TotalPlanData.shared.totalCountOfFood[1]! * eachPriceFood[1]!)
        guard let tp = TotalPlanData.shared.totalCostOfFood[1] else{return}
        guard let tc = TotalPlanData.shared.totalCountOfFood[1] else{return}
        priceOfMiddle.text = String(tp.commaRepresentation) //+ "원"
        numOfMiddle.text = String(tc)
        priceOfMiddle.sizeToFit()
        //
        masterTotalPrice += eachPriceFood[1]!
        totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
        totalCountOfFood.text = String(returnCount())
        totalPriceOfFood.sizeToFit()
        totalCountOfFood.sizeToFit()
        btthEnable()
    }
    
    @IBAction func pubMinus(_ sender: Any) {
        if TotalPlanData.shared.totalCountOfFood[2]! > 0{
            TotalPlanData.shared.totalCountOfFood[2]! -= 1
            guard let ep = eachPriceFood[2] else{return}
            guard let tc = TotalPlanData.shared.totalCountOfFood[2] else{return}
            TotalPlanData.shared.totalCostOfFood[2] = ep * tc
            guard let tp = TotalPlanData.shared.totalCostOfFood[2] else{return}
            
            priceOfLow.text = String(tp.commaRepresentation) //+ "원"
            numOfLow.text = String(tc)
            priceOfLow.sizeToFit()
            //
            masterTotalPrice -= eachPriceFood[2]!
            totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
            totalCountOfFood.text = String(returnCount())
            totalPriceOfFood.sizeToFit()
            totalCountOfFood.sizeToFit()
            btthEnable()
        }
    }
    
    @IBAction func pubPlus(_ sender: Any) {
        TotalPlanData.shared.totalCountOfFood[2]! += 1
        TotalPlanData.shared.totalCostOfFood[2]! = (TotalPlanData.shared.totalCountOfFood[2]! * eachPriceFood[2]!)
        guard let tp = TotalPlanData.shared.totalCostOfFood[2] else{return}
        guard let tc = TotalPlanData.shared.totalCountOfFood[2] else{return}
        priceOfLow.text = String(tp.commaRepresentation) //+ "원"
        numOfLow.text = String(tc)
        priceOfLow.sizeToFit()
        //
        masterTotalPrice += eachPriceFood[2]!
        totalPriceOfFood.text = String(masterTotalPrice.commaRepresentation)
        totalCountOfFood.text = String(returnCount())
        totalPriceOfFood.sizeToFit()
        totalCountOfFood.sizeToFit()
        btthEnable()
    }
    
    
    
    func returnCount() -> Int{
        guard let tc = TotalPlanData.shared.totalCountOfFood[0] else{return -1}
        guard let tc1 = TotalPlanData.shared.totalCountOfFood[1] else{return -1}
        guard let tc2 = TotalPlanData.shared.totalCountOfFood[2] else{return -1}
        print(tc)
        print(tc1)
        print(tc2)
        return tc + tc1 + tc2
        
    }

    
    func btthEnable(){
        if returnCount() > 0{
            completeBttn.isEnabled = true
        }
        else{
            completeBttn.isEnabled = false
        }
    }
    
    
}
