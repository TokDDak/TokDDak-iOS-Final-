//
//  MainViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, sendBackDelegate{
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var completeBttn: UIButton!
    
    @IBOutlet weak var highHotel: UIButton!
    @IBOutlet weak var middleHotel: UIButton!
    @IBOutlet weak var lowHotel: UIButton!
    @IBOutlet weak var apartment: UIButton!
    @IBOutlet weak var hostel: UIButton!
    
    @IBOutlet weak var numOfsleepDay: UILabel!
    
    
    var nowSelectedStatus : Int = 0 //현재 진행중인 카테고리 넘버
    var selectedCategoryData : [Int] = [] //전뷰에서 1개 팝하고 남은 카테고리 순서 가져오기
    var menuSelected : [Int : Int] = [0:0, 1:0, 2:0, 3:0, 4:0]
    //딕셔너리 이용해서 [카테고리넘버 : 0(선택안됨), 1(선택됨)
    var basePriceOfeachHotel : [Int : Int] = [0:0, 1:0, 2:0, 3:0, 4:0] //호텔 가격
    var baseDayOfeachHotel : [Int : Int] = [0:0, 1:0, 2:0, 3:0, 4:0] //호텔 박수
    var totalBase = 0 //금액을 더할 때 기존 돈
    var totalBaseOfDay = 0 // 박 수 계산용 임시 변수
    var pgValue: Int = 0 //프로그레스바 단계, 즉 고른 카테고리 수
    var progressBarOffset : Int = 1 //프로그래스바 checkvalue
    
    func dataReceived(data: String, hotelNum: Int, day: Int) {
        guard let getInt = Int(data) else {return}
        print("getInt = \(getInt)")
        basePriceOfeachHotel[hotelNum] = basePriceOfeachHotel[hotelNum]! + getInt
        totalBase = totalBase + basePriceOfeachHotel[hotelNum]!
        totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
        baseDayOfeachHotel[hotelNum]! = day
        totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[hotelNum]!
        numOfsleepDay.text = String(totalBaseOfDay)
        for (i, v) in basePriceOfeachHotel{
            print("hotel \(i) = price \(v)")
        }
    }
    
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
        
        for (i, v) in baseDayOfeachHotel{
            print("i : \(i), v : \(v)")
        }
        
        
        
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
        if menuSelected[0] == 0{
            menuSelected[0] = 1
            highHotel.setImage(UIImage(named: "makeBtnStayTopActive"), for: .normal)
            completeBttn.isEnabled = true
            print("Day 0 :  \(baseDayOfeachHotel[0]!)")
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[0]!
            numOfsleepDay.text = String(totalBaseOfDay)
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[0] = 0
            highHotel.setImage(UIImage(named: "makeBtnStayTop"), for: .normal)
            totalBase = totalBase - basePriceOfeachHotel[0]!
            totalBaseOfDay = totalBaseOfDay - baseDayOfeachHotel[0]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
            basePriceOfeachHotel[0] = 0
            baseDayOfeachHotel[0]! = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
            print("Day 0 :  \(baseDayOfeachHotel[0]!)")

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
            print("Day 1 :  \(baseDayOfeachHotel[1]!)")
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            print("Day 1 :  \(baseDayOfeachHotel[1]!)")
            menuSelected[1] = 0
            middleHotel.setImage(UIImage(named: "makeBtnStayHigh"), for: .normal)
            totalBase = totalBase - basePriceOfeachHotel[1]!
            totalBaseOfDay = totalBaseOfDay - baseDayOfeachHotel[1]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
            basePriceOfeachHotel[1] = 0
            baseDayOfeachHotel[1]! = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
            print("Day 1 :  \(baseDayOfeachHotel[1]!)")
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
            print("Day 2 :  \(baseDayOfeachHotel[2]!)")
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[2] = 0
            lowHotel.setImage(UIImage(named: "makeBtnStayGeneral"), for: .normal)
            totalBase = totalBase - basePriceOfeachHotel[2]!
            totalBaseOfDay = totalBaseOfDay - baseDayOfeachHotel[2]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
            basePriceOfeachHotel[2] = 0
            baseDayOfeachHotel[2]! = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
            print("Day 2 :  \(baseDayOfeachHotel[2]!)")
        }
    }
    
    @IBAction func apartmentClick(_ sender: Any) {
        nowSelectedStatus = 3
        if menuSelected[3] == 0{
            menuSelected[3] = 1
            apartment.setImage(UIImage(named: "makeBtnStayAptActive"), for: .normal)
            completeBttn.isEnabled = true
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[3]!
            numOfsleepDay.text = String(totalBaseOfDay)
            print("Day 3 :  \(baseDayOfeachHotel[3]!)")
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[3] = 0
            apartment.setImage(UIImage(named: "makeBtnStayApt"), for: .normal)
            totalBase = totalBase - basePriceOfeachHotel[3]!
            totalBaseOfDay = totalBaseOfDay - baseDayOfeachHotel[3]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
            basePriceOfeachHotel[3] = 0
            baseDayOfeachHotel[3]! = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
            print("Day 3 :  \(baseDayOfeachHotel[3]!)")
        }
    }
    
    @IBAction func hostelClick(_ sender: Any) {
        nowSelectedStatus = 4
        if menuSelected[4] == 0{
            menuSelected[4] = 1
            hostel.setImage(UIImage(named: "makeBtnStayHostelActive"), for: .normal)
            completeBttn.isEnabled = true
//            totalBaseOfDay = totalBaseOfDay + baseDayOfeachHotel[4]!
            numOfsleepDay.text = String(totalBaseOfDay)
            print("Day 4 :  \(baseDayOfeachHotel[4]!)")
            goToPopUpViewController()
        }
        else{
            print("menuSelected[0] == 1")
            menuSelected[4] = 0
            hostel.setImage(UIImage(named: "makeBtnStayHostel"), for: .normal)
            totalBase = totalBase - basePriceOfeachHotel[4]!
            totalBaseOfDay = totalBaseOfDay - baseDayOfeachHotel[4]!
            numOfsleepDay.text = String(totalBaseOfDay)
            totalPrice.text = String(totalBase.commaRepresentation2) + " ₩"
            basePriceOfeachHotel[4] = 0
            baseDayOfeachHotel[4] = 0
            completeBttn.isEnabled = (totalBase == 0) ? false : true
            print("Day 4 :  \(baseDayOfeachHotel[4]!)")
        }
    }
    
    
    
    
    
    func goToPopUpViewController() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! ViewController
        secondVC.delegate = self
        if nowSelectedStatus == 0{
            secondVC.hotelNum = 0
            secondVC.nameOfHotel = "최고급호텔"
        }
        if nowSelectedStatus == 1{
            secondVC.hotelNum = 1
            secondVC.nameOfHotel = "고급호텔"
        }
        if nowSelectedStatus == 2{
            secondVC.hotelNum = 2
            secondVC.nameOfHotel = "일반호텔"
        }
        if nowSelectedStatus == 3{
            secondVC.hotelNum = 3
            secondVC.nameOfHotel = "아파트"
        }
        if nowSelectedStatus == 4{
            secondVC.hotelNum = 4
            secondVC.nameOfHotel = "호스텔"
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
