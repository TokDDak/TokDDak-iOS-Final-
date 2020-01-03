//
//  MainViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

enum Hotel: Int, Comparable {
    case high = 5
    case middle = 4
    case low = 3
    case apartment = 2
    
    var name: String {
        switch self {
        case .high:
            return "최고급호텔"
        case .middle:
            return "고급호텔"
        case .low:
            return "일반호텔"
        case .apartment:
            return "저가호텔"
        }
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var completeBttn: UIButton!
    
    @IBOutlet weak var highHotel: UIButton!
    @IBOutlet weak var middleHotel: UIButton!
    @IBOutlet weak var lowHotel: UIButton!
    @IBOutlet weak var apartment: UIButton!
//    @IBOutlet weak var hostel: UIButton!
    
    @IBOutlet weak var numOfsleepDay: UILabel!
    
    
    var nowSelectedStatus : Int = 0 //현재 진행중인 카테고리 넘버
    var selectedCategoryData : [Int] = [] //전뷰에서 1개 팝하고 남은 카테고리 순서 가져오기
    var menuSelected : [Int : Int] = [0:0, 1:0, 2:0, 3:0]
    var totalBase = 0 //금액을 더할 때 기존 돈
    var totalBaseOfDay = 0 // 박 수 계산용 임시 변수
    var pgValue: Int = 0 //프로그레스바 단계, 즉 고른 카테고리 수
    var progressBarOffset : Int = 1 //프로그래스바 checkvalue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //프로그래스바 전체 1.0에서 나누기로 진행
        print(progressBarOffset)
        progressBar.progress = Float(1.0 / Double(pgValue))
        let yourBackImage = UIImage(named: "naviBtnBackB")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        /*navaigation 이름 변경*/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        /*navaigation border 삭제*/
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    
    @IBAction func nextCategory(_ sender: Any) {
        
//        for (i, v) in baseDayOfEachHotel{
//            print("i : \(i), v : \(v)")
//        }
//
        
        
        if selectedCategoryData.count == 0{
            //go to next category flow
        }
        if selectedCategoryData.count > 0 {
            if let nextCategory = selectedCategoryData.first{
                if nextCategory == 1{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryFoodViewController") as! CategoryFoodViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.masterTotalPrice = totalBase
                self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 2{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryDrinkViewController") as! CategoryDrinkViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.masterTotalPrice = totalBase
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 3{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryTransportViewController") as! CategoryTransportViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.masterTotalPrice = totalBase
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 4{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "CategoiryShoppingViewController") as! CategoiryShoppingViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.masterTotalPrice = totalBase
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                if nextCategory == 5{
                    let vc = storyboard?.instantiateViewController(withIdentifier: "ActivityCellViewController") as! ActivityCellViewController
                    var tmpSelectedCategory = selectedCategoryData
                    tmpSelectedCategory.remove(at: 0)
                    vc.selectedCategoryData = tmpSelectedCategory
                    vc.progressBarOffset = progressBarOffset + 1
                    vc.pgValue = pgValue
                    vc.basePriceOfActivity = totalBase
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    @IBAction func highHotelClick(_ sender: Any) {
        nowSelectedStatus = 0
        if menuSelected[0] == 0 {
            menuSelected[0] = 1
            highHotel.setImage(UIImage(named: "makeBtnStayTopActive"), for: .normal)
            completeBttn.isEnabled = true
//            print("Day 0 :  \(baseDayOfEachHotel[0]!)")
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[0]!
            numOfsleepDay.text = String(totalBaseOfDay)
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[0] = 0
            highHotel.setImage(UIImage(named: "makeBtnStayTop"), for: .normal)
            totalBase = totalBase - TotalPlanData.shared.totalCostOfHotel[.high]!
            totalBaseOfDay = totalBaseOfDay - TotalPlanData.shared.totalDayOfHotel[.high]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2)
            TotalPlanData.shared.totalCostOfHotel[.high] = 0
            TotalPlanData.shared.totalDayOfHotel[.high]! = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
        }
    }
    
    @IBAction func middleHotelClick(_ sender: Any) {
        nowSelectedStatus = 1
        if menuSelected[1] == 0{
            menuSelected[1] = 1
            middleHotel.setImage(UIImage(named: "makeBtnStayHighActive"), for: .normal)
            completeBttn.isEnabled = (totalBase == 0) ? false : true
            completeBttn.isEnabled = true
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[1]!
            numOfsleepDay.text = String(totalBaseOfDay)
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[1] = 0
            middleHotel.setImage(UIImage(named: "makeBtnStayHigh"), for: .normal)
            totalBase = totalBase - TotalPlanData.shared.totalCostOfHotel[.middle]!
            totalBaseOfDay = totalBaseOfDay - TotalPlanData.shared.totalDayOfHotel[.middle]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2)
            TotalPlanData.shared.totalCostOfHotel[.middle] = 0
            TotalPlanData.shared.totalDayOfHotel[.middle]! = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
        }
    }
    
    @IBAction func lowHotelClick(_ sender: Any) {
        nowSelectedStatus = 2
        if menuSelected[2] == 0{
            menuSelected[2] = 1
            lowHotel.setImage(UIImage(named: "makeBtnStayGeneralActive"), for: .normal)
            completeBttn.isEnabled = true
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[2]!
            numOfsleepDay.text = String(totalBaseOfDay)
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[2] = 0
            lowHotel.setImage(UIImage(named: "makeBtnStayGeneral"), for: .normal)
            totalBase = totalBase - TotalPlanData.shared.totalCostOfHotel[.low]!
            totalBaseOfDay = totalBaseOfDay - TotalPlanData.shared.totalDayOfHotel[.low]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2)
            TotalPlanData.shared.totalCostOfHotel[.low] = 0
            TotalPlanData.shared.totalDayOfHotel[.low] = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
        }
    }
    
    @IBAction func apartmentClick(_ sender: Any) {
        nowSelectedStatus = 3
        if menuSelected[3] == 0{
            menuSelected[3] = 1
            apartment.setImage(UIImage(named: "makeBtnStayCheapActive"), for: .normal)
            completeBttn.isEnabled = true
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[3]!
            numOfsleepDay.text = String(totalBaseOfDay)
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[3] = 0
            apartment.setImage(UIImage(named: "makeBtnStayCheap"), for: .normal)
            totalBase = totalBase - TotalPlanData.shared.totalCostOfHotel[.apartment]!
            totalBaseOfDay = totalBaseOfDay - TotalPlanData.shared.totalDayOfHotel[.apartment]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2)
            TotalPlanData.shared.totalCostOfHotel[.apartment] = 0
            TotalPlanData.shared.totalDayOfHotel[.apartment] = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
        }
    }
    
//    @IBAction func hostelClick(_ sender: Any) {
//        nowSelectedStatus = 4
//        if menuSelected[4] == 0{
//            menuSelected[4] = 1
//            hostel.setImage(UIImage(named: "makeBtnStayHostelActive"), for: .normal)
//            completeBttn.isEnabled = true
////            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[4]!
//            numOfsleepDay.text = String(totalBaseOfDay)
//            print("Day 4 :  \(baseDayOfeachHotel[4]!)")
//            goToPopUpViewController()
//        }
//        else{
//            print("menuSelected[0] == 1")
//            menuSelected[4] = 0
//            hostel.setImage(UIImage(named: "makeBtnStayHostel"), for: .normal)
//            totalBase = totalBase - basePriceOfeachHotel[4]!
//            totalBaseOfDay = totalBaseOfDay - baseDayOfeachHotel[4]!
//            numOfsleepDay.text = String(totalBaseOfDay)
//            totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
//            basePriceOfeachHotel[4] = 0
//            baseDayOfeachHotel[4] = 0
//            completeBttn.isEnabled = (totalBase == 0) ? false : true
//            print("Day 4 :  \(baseDayOfeachHotel[4]!)")
//        }
//    }
    
    
    
    
    
    func goToPopUpViewController() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! PopUpViewController
        secondVC.delegate = self
        if nowSelectedStatus == 0{
            secondVC.subCategory = 5
            secondVC.nameOfHotel = "최고급호텔"
        }
        if nowSelectedStatus == 1{
            secondVC.subCategory = 4
            secondVC.nameOfHotel = "고급호텔"
        }
        if nowSelectedStatus == 2{
            secondVC.subCategory = 3
            secondVC.nameOfHotel = "일반호텔"
        }
        if nowSelectedStatus == 3{
            secondVC.subCategory = 2
            secondVC.nameOfHotel = "저가호텔"
        }
      
        present(secondVC, animated: true)
    }
    
    
    // 세그없이 팝업창 띄우기
    //    @IBAction func showPopup(_ sender: Any) {
    //                //print(menuCnt)
    //                let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
    //                let popupVC = storyBoard.instantiateViewController(withIdentifier: "PopupViewController")
    //                popupVC.modalPresentationStyle = .overCurrentContext
    //                present(popupVC, animated: true, completion: nil)
    //
    //    }
    //
}

extension MainViewController: PopUpViewControllerDelegate {
    func popUpViewController(_ viewController: PopUpViewController, didReceiveData data: String, hotelNumber: Int, day: Int) {
        guard let getInt = Int(data) else {return}
        let hotel = Hotel(rawValue: hotelNumber) ?? .high
        TotalPlanData.shared.totalCostOfHotel[hotel] = TotalPlanData.shared.totalCostOfHotel[hotel]! + getInt
        totalBase = totalBase + TotalPlanData.shared.totalCostOfHotel[hotel]!
        totalPrice.text = String(totalBase.commaRepresentation2)
        TotalPlanData.shared.totalDayOfHotel[hotel] = day
        totalBaseOfDay = totalBaseOfDay + TotalPlanData.shared.totalDayOfHotel[hotel]!
        numOfsleepDay.text = String(totalBaseOfDay)
//        for (i, v) in basePriceOfEachHotel{
//            print("hotel \(i) = price \(v)")
//        }
    }
}



























extension Int { //자릿수 표현 extension
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    var commaRepresentation2: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
