//
//  CategoryDrinkViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class CategoryDrinkViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var cafeMinusBttn: UIButton!
    @IBOutlet weak var cafePlusBttn: UIButton!
    @IBOutlet weak var desertMinusBttn: UIButton!
    @IBOutlet weak var desertPlusBttn: UIButton!
    @IBOutlet weak var pubMinusBttn: UIButton!
    @IBOutlet weak var pubPlusBttn: UIButton!
    @IBOutlet weak var numOfCafe: UILabel!
    @IBOutlet weak var numOfDesert: UILabel!
    @IBOutlet weak var numOfPub: UILabel!
    @IBOutlet weak var priceOfCafe: UILabel!
    @IBOutlet weak var priceOfDesert: UILabel!
    @IBOutlet weak var priceOfPub: UILabel!
    @IBOutlet weak var avgPriceOfCafe: UILabel!
    @IBOutlet weak var avgPriceOfDesert: UILabel!
    @IBOutlet weak var avgPriceOfPub: UILabel!
    @IBOutlet weak var totalPriceOfDrink: UILabel!
    @IBOutlet weak var totalCountOfDrink: UILabel!
    
    
    var selectedCategoryData : [Int] = []
    var progressBarOffset : Int = 1
    var pgValue : Int = 0

    //    var totalPriceOfCafe : Int = 0
    //    var totalPriceOfDesert : Int = 0
    //    var totalPriceOfPub : Int = 0
    //    var eachPriceOfCafe : Int = 21000
    //    var eachPriceOfDesert : Int = 21000
    //    var eachPriceOfPub : Int = 21000
    
    
    //    var totalCountOfCafe : Int = 0
    //    var totalCountOfDesert : Int = 0
    //    var totalCountOfPub : Int = 0
    
    var totalPriceDrink : [Int : Int] = [0:0, 1:0, 2:0]
    var eachPriceDrink : [Int : Int] = [0:21000, 1:21000, 2:21000]
    var totalCountDrink : [Int : Int] = [0:0, 1:0, 2:0]
    var masterTotalPrice : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
        avgPriceOfCafe.text = String(eachPriceDrink[0]!.commaRepresentation) + "원"
        avgPriceOfDesert.text = String(eachPriceDrink[1]!.commaRepresentation) + "원"
        avgPriceOfPub.text = String(eachPriceDrink[2]!.commaRepresentation) + "원"
        
        
        
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
    
    
    
    /*마이너스 플러스 버튼 눌렀을 때 동작*/
    
    @IBAction func cafeMinus(_ sender: Any) {
        
        if totalCountDrink[0]! > 0{
            totalCountDrink[0]! -= 1
            guard let ep = eachPriceDrink[0] else{return}
            guard let tc = totalCountDrink[0] else{return}
            totalPriceDrink[0] = ep * tc
            guard let tp = totalPriceDrink[0] else{return}
            
            priceOfCafe.text = String(tp.commaRepresentation) //+ "원"
            numOfCafe.text = String(tc)
            priceOfCafe.sizeToFit()
            print("######## \(returnPrice())")
            totalPriceOfDrink.text = String(returnPrice().commaRepresentation)
            totalCountOfDrink.text = String(returnCount())
            totalPriceOfDrink.sizeToFit()
            totalCountOfDrink.sizeToFit()
        }
    }
    
    @IBAction func cafePlus(_ sender: Any) {
        totalCountDrink[0]! += 1
        totalPriceDrink[0]! = (totalCountDrink[0]! * eachPriceDrink[0]!)
        guard let tp = totalPriceDrink[0] else{return}
        guard let tc = totalCountDrink[0] else{return}
        priceOfCafe.text = String(tp.commaRepresentation) //+ "원"
        numOfCafe.text = String(tc)
        priceOfCafe.sizeToFit()
        totalPriceOfDrink.text = String(returnPrice().commaRepresentation)
        totalCountOfDrink.text = String(returnCount())
        totalPriceOfDrink.sizeToFit()
        totalCountOfDrink.sizeToFit()
    }
    
    @IBAction func desertMinus(_ sender: Any) {
        if totalCountDrink[1]! > 0{
            totalCountDrink[1]! -= 1
            guard let ep = eachPriceDrink[1] else{return}
            guard let tc = totalCountDrink[1] else{return}
            totalPriceDrink[1] = ep * tc
            guard let tp = totalPriceDrink[1] else{return}
            
            priceOfDesert.text = String(tp.commaRepresentation) //+ "원"
            numOfDesert.text = String(tc)
            priceOfDesert.sizeToFit()
            totalPriceOfDrink.text = String(returnPrice().commaRepresentation)
            totalCountOfDrink.text = String(returnCount())
            totalPriceOfDrink.sizeToFit()
            totalCountOfDrink.sizeToFit()
        }
    }
    
    @IBAction func desertPlus(_ sender: Any) {
        totalCountDrink[1]! += 1
        totalPriceDrink[1]! = (totalCountDrink[1]! * eachPriceDrink[1]!)
        guard let tp = totalPriceDrink[1] else{return}
        guard let tc = totalCountDrink[1] else{return}
        priceOfDesert.text = String(tp.commaRepresentation) //+ "원"
        numOfDesert.text = String(tc)
        priceOfDesert.sizeToFit()
        totalPriceOfDrink.text = String(returnPrice().commaRepresentation)
        totalCountOfDrink.text = String(returnCount())
        totalPriceOfDrink.sizeToFit()
        totalCountOfDrink.sizeToFit()
    }
    
    @IBAction func pubMinus(_ sender: Any) {
        if totalCountDrink[2]! > 0{
            totalCountDrink[2]! -= 1
            guard let ep = eachPriceDrink[2] else{return}
            guard let tc = totalCountDrink[2] else{return}
            totalPriceDrink[2] = ep * tc
            guard let tp = totalPriceDrink[2] else{return}
            
            priceOfPub.text = String(tp.commaRepresentation) //+ "원"
            numOfPub.text = String(tc)
            priceOfPub.sizeToFit()
            totalPriceOfDrink.text = String(returnPrice().commaRepresentation)
            totalCountOfDrink.text = String(returnCount())
            totalPriceOfDrink.sizeToFit()
            totalCountOfDrink.sizeToFit()
        }
    }
    
    @IBAction func pubPlus(_ sender: Any) {
        totalCountDrink[2]! += 1
        totalPriceDrink[2]! = (totalCountDrink[2]! * eachPriceDrink[2]!)
        guard let tp = totalPriceDrink[2] else{return}
        guard let tc = totalCountDrink[2] else{return}
        priceOfPub.text = String(tp.commaRepresentation) //+ "원"
        numOfPub.text = String(tc)
        priceOfPub.sizeToFit()
        totalPriceOfDrink.text = String(returnPrice().commaRepresentation)
        totalCountOfDrink.text = String(returnCount())
        totalPriceOfDrink.sizeToFit()
        totalCountOfDrink.sizeToFit()
    }
    
    
    
    
    
    
    
    func returnCount() -> Int{
        guard let tc = totalCountDrink[0] else{return -1}
        guard let tc1 = totalCountDrink[1] else{return -1}
        guard let tc2 = totalCountDrink[2] else{return -1}
        print(tc)
        print(tc1)
        print(tc2)
        return tc + tc1 + tc2
        
    }
    
    func returnPrice() -> Int{
        guard let tp = totalPriceDrink[0] else{return -1}
        guard let tp1 = totalPriceDrink[1] else{return -1}
        guard let tp2 = totalPriceDrink[2] else{return -1}
        print(tp)
        print(tp1)
        print(tp2)
        return tp + tp1 + tp2
    }
    
    
    
    
    
    
    
    
    
    
}
