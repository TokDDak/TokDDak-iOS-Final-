//
//  CategoryFoodViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var totalCountOfFood: UILabel!
    @IBOutlet weak var totalPriceOfFood: UILabel!
    
    
    var totalPriceFood : [Int : Int] = [0:0, 1:0, 2:0]
    var eachPriceFood : [Int : Int] = [0:21000, 1:21000, 2:21000]
    var totalCountFood : [Int : Int] = [0:0, 1:0, 2:0]

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func nextCategory(_ sender: Any) {
        if selectedCategoryData.count == 0{
            //go to next category flow
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
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 3{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryTransportViewController") as! CategoryTransportViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
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
    
    
    
    
    
    @IBAction func cafeMinus(_ sender: Any) {
        
        if totalCountFood[0]! > 0{
            totalCountFood[0]! -= 1
            guard let ep = eachPriceFood[0] else{return}
            guard let tc = totalCountFood[0] else{return}
            totalPriceFood[0] = ep * tc
            guard let tp = totalPriceFood[0] else{return}
            
            priceOfHigh.text = String(tp.commaRepresentation) //+ "원"
            numOfHigh.text = String(tc)
            priceOfHigh.sizeToFit()
            totalPriceOfFood.text = String(returnPrice().commaRepresentation)
            totalCountOfFood.text = String(returnCount())
            totalPriceOfFood.sizeToFit()
            totalCountOfFood.sizeToFit()
        }
    }
    
    @IBAction func cafePlus(_ sender: Any) {
        totalCountFood[0]! += 1
        totalPriceFood[0]! = (totalCountFood[0]! * eachPriceFood[0]!)
        guard let tp = totalPriceFood[0] else{return}
        guard let tc = totalCountFood[0] else{return}
        priceOfHigh.text = String(tp.commaRepresentation) //+ "원"
        numOfHigh.text = String(tc)
        priceOfHigh.sizeToFit()
        totalPriceOfFood.text = String(returnPrice().commaRepresentation)
        totalCountOfFood.text = String(returnCount())
        totalPriceOfFood.sizeToFit()
        totalCountOfFood.sizeToFit()
    }
    
    @IBAction func desertMinus(_ sender: Any) {
        if totalCountFood[1]! > 0{
            totalCountFood[1]! -= 1
            guard let ep = eachPriceFood[1] else{return}
            guard let tc = totalCountFood[1] else{return}
            totalPriceFood[1] = ep * tc
            guard let tp = totalPriceFood[1] else{return}
            
            priceOfMiddle.text = String(tp.commaRepresentation) //+ "원"
            numOfMiddle.text = String(tc)
            priceOfMiddle.sizeToFit()
            totalPriceOfFood.text = String(returnPrice().commaRepresentation)
            totalCountOfFood.text = String(returnCount())
            totalPriceOfFood.sizeToFit()
            totalCountOfFood.sizeToFit()
        }
    }
    
    @IBAction func desertPlus(_ sender: Any) {
        totalCountFood[1]! += 1
        totalPriceFood[1]! = (totalCountFood[1]! * eachPriceFood[1]!)
        guard let tp = totalPriceFood[1] else{return}
        guard let tc = totalCountFood[1] else{return}
        priceOfMiddle.text = String(tp.commaRepresentation) //+ "원"
        numOfMiddle.text = String(tc)
        priceOfMiddle.sizeToFit()
        totalPriceOfFood.text = String(returnPrice().commaRepresentation)
        totalCountOfFood.text = String(returnCount())
        totalPriceOfFood.sizeToFit()
        totalCountOfFood.sizeToFit()
    }
    
    @IBAction func pubMinus(_ sender: Any) {
        if totalCountFood[2]! > 0{
            totalCountFood[2]! -= 1
            guard let ep = eachPriceFood[2] else{return}
            guard let tc = totalCountFood[2] else{return}
            totalPriceFood[2] = ep * tc
            guard let tp = totalPriceFood[2] else{return}
            
            priceOfLow.text = String(tp.commaRepresentation) //+ "원"
            numOfLow.text = String(tc)
            priceOfLow.sizeToFit()
            totalPriceOfFood.text = String(returnPrice().commaRepresentation)
            totalCountOfFood.text = String(returnCount())
            totalPriceOfFood.sizeToFit()
            totalCountOfFood.sizeToFit()
        }
    }
    
    @IBAction func pubPlus(_ sender: Any) {
        totalCountFood[2]! += 1
        totalPriceFood[2]! = (totalCountFood[2]! * eachPriceFood[2]!)
        guard let tp = totalPriceFood[2] else{return}
        guard let tc = totalCountFood[2] else{return}
        priceOfLow.text = String(tp.commaRepresentation) //+ "원"
        numOfLow.text = String(tc)
        priceOfLow.sizeToFit()
        totalPriceOfFood.text = String(returnPrice().commaRepresentation)
        totalCountOfFood.text = String(returnCount())
        totalPriceOfFood.sizeToFit()
        totalCountOfFood.sizeToFit()
    }
    
    
    
    func returnCount() -> Int{
        guard let tc = totalCountFood[0] else{return -1}
        guard let tc1 = totalCountFood[1] else{return -1}
        guard let tc2 = totalCountFood[2] else{return -1}
        print(tc)
        print(tc1)
        print(tc2)
        return tc + tc1 + tc2
        
    }
    
    func returnPrice() -> Int{
        guard let tp = totalPriceFood[0] else{return -1}
        guard let tp1 = totalPriceFood[1] else{return -1}
        guard let tp2 = totalPriceFood[2] else{return -1}
        print(tp)
        print(tp1)
        print(tp2)
        return tp + tp1 + tp2
    }
    
    
    
}
