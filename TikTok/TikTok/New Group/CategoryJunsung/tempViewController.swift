//
//  tempViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/26.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit




class tempViewController: UIViewController {

    
    
    @IBOutlet weak var hotelViewBttn: UIButton!
    @IBOutlet weak var restaurantViewBttn: UIButton!
    @IBOutlet weak var drinkViewBttn: UIButton!
    @IBOutlet weak var transportViewBttn: UIButton!
    @IBOutlet weak var shoppingViewBttn: UIButton!
    @IBOutlet weak var activityViewBttn: UIButton!
    
  
    
    @IBOutlet weak var completeBttn: UIButton!
    
    /*처음 default 선택이 6개이므로*/
    
    var infoOfDate : [String:String] = ["city" : "null", "fromDate" : "null", "toDate" : "null"] // cityname
    
    var numOfselected : Int = 6 //선택된 카테고리 갯수
//    shared.selectedCategory : [String : Bool] = ["hotel" : true, "restaurant" : true, "drink" : true, "transport" : true, "shopping" : true, "activity" : true] //선택된거 true로 바뀜
    var selectedCategoryData : [Int] = [0,1,2,3,4,5] //카테고리 고른거 순서대로 뷰 띄우기 위해사
    // custom view shadow 만들기
    func makeShadow(outerView : UIView){
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.gray.cgColor
        outerView.layer.shadowOpacity = 0.1
        outerView.layer.shadowOffset = CGSize(width: 23, height: 10)
        outerView.layer.shadowRadius = 3
        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 10).cgPath
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*여기서 안바꿔주면, 클릭시 바뀌는 이벤트일 때 처음에 else문부터 들어가서, 두번클릭해야 바뀌는거 방지*/
        hotelViewBttn.setImage(UIImage(named: "btnMakeStayMinus"), for: .normal)
        restaurantViewBttn.setImage(UIImage(named: "btnMakeFoodMinus"), for: .normal)
        drinkViewBttn.setImage(UIImage(named: "btnMakeSnacksMinus"), for: .normal)
        transportViewBttn.setImage(UIImage(named: "btnMakeTrafficMinus"), for: .normal)
        shoppingViewBttn.setImage(UIImage(named: "btnMakeShoppingMinus"), for: .normal)
        activityViewBttn.setImage(UIImage(named: "btnMakeActivityMinus"), for: .normal)
        
        /*view shadow 만들기*/
//        makeShadow(outerView: hotelView)
//        makeShadow(outerView: restaurantView)
//        makeShadow(outerView: drinkView)
//        makeShadow(outerView: tranportView)
//        makeShadow(outerView: shoppingView)
//        makeShadow(outerView: activityView)
            /*navaigation 이미지 변경*/
//            let yourBackImage = UIImage(named: "naviBtnBackBlack")
        let yourBackImage = UIImage(named: "naviBtnBackBlack")
            self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        
           // navaigation 이름변경
//            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
             /*navaigation border 삭제*/
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /*버튼 이미지가 -일때는 클릭시 +로, +일때는 -로/ 라벨 색 회색 변경*/
    @IBAction func pressHotelViewBttn(_ sender: Any) {
        if hotelViewBttn.image(for: .normal) == UIImage(named: "btnMakeStayMinus"){
            hotelViewBttn.setImage(UIImage(named: "btnMakeStayPlus"), for: .normal)
            numOfselected = numOfselected - 1
            TotalPlanData.shared.selectedCategory["hotel"] = false
            for (i, v) in selectedCategoryData.enumerated(){
                if v == 0{
                    selectedCategoryData.remove(at: i)
                }
            }
        }
        else{
           
            hotelViewBttn.setImage(UIImage(named: "btnMakeStayMinus"), for: .normal)
            numOfselected = numOfselected + 1
            TotalPlanData.shared.selectedCategory["hotel"] = true
            selectedCategoryData.append(0)
        }
        /*전체 해제시 선택완료 버튼 비활성화*/
        if numOfselected == 0{
            completeBttn.isEnabled = false
        }
        else{
            completeBttn.isEnabled = true
        }
        selectedCategoryData.sort()
        print(selectedCategoryData)
    }
    @IBAction func pressRestaurantViewBttn(_ sender: Any) {
        if restaurantViewBttn.image(for: .normal) == UIImage(named: "btnMakeFoodMinus"){
            restaurantViewBttn.setImage(UIImage(named: "btnMakeFoodPlus"), for: .normal)
            numOfselected = numOfselected - 1
            TotalPlanData.shared.selectedCategory["restaurant"] = false
            for (i, v) in selectedCategoryData.enumerated(){
                if v == 1{
                    selectedCategoryData.remove(at: i)
                }
            }
        }
            
        else{
            restaurantViewBttn.setImage(UIImage(named: "btnMakeFoodMinus"), for: .normal)
            numOfselected = numOfselected + 1
            TotalPlanData.shared.selectedCategory["restaurant"] = true
            selectedCategoryData.append(1)
        }
        /*전체 해제시 선택완료 버튼 비활성화*/
        if numOfselected == 0{
                   completeBttn.isEnabled = false
               }
               else{
                   completeBttn.isEnabled = true
               }
        selectedCategoryData.sort()
        print(selectedCategoryData)
    }
    @IBAction func pressDrinkViewBttn(_ sender: Any) {
        if drinkViewBttn.image(for: .normal) == UIImage(named: "btnMakeSnacksMinus"){
            drinkViewBttn.setImage(UIImage(named: "btnMakeSnacksPlus"), for: .normal)
            numOfselected = numOfselected - 1
            TotalPlanData.shared.selectedCategory["drink"] = false
            for (i, v) in selectedCategoryData.enumerated(){
                if v == 2{
                    selectedCategoryData.remove(at: i)
                }
            }
        }
        else{
            drinkViewBttn.setImage(UIImage(named: "btnMakeSnacksMinus"), for: .normal)
            numOfselected = numOfselected + 1
            TotalPlanData.shared.selectedCategory["drink"] = true
            selectedCategoryData.append(2)
        }
        /*전체 해제시 선택완료 버튼 비활성화*/
        if numOfselected == 0{
                   completeBttn.isEnabled = false
               }
               else{
                   completeBttn.isEnabled = true
               }
        selectedCategoryData.sort()
        print(selectedCategoryData)
    }
    @IBAction func pressTransportViewBttn(_ sender: Any) {
        if transportViewBttn.image(for: .normal) == UIImage(named: "btnMakeTrafficMinus"){
            transportViewBttn.setImage(UIImage(named: "btnMakeTrafficPlus"), for: .normal)
            numOfselected = numOfselected - 1
            TotalPlanData.shared.selectedCategory["transport"] = false
            for (i, v) in selectedCategoryData.enumerated(){
                if v == 3{
                    selectedCategoryData.remove(at: i)
                }
            }
        }
        else{
            transportViewBttn.setImage(UIImage(named: "btnMakeTrafficMinus"), for: .normal)
            numOfselected = numOfselected + 1
            TotalPlanData.shared.selectedCategory["transport"] = true
            selectedCategoryData.append(3)
        }
        /*전체 해제시 선택완료 버튼 비활성화*/
        if numOfselected == 0{
                   completeBttn.isEnabled = false
               }
               else{
                   completeBttn.isEnabled = true
               }
        selectedCategoryData.sort()
        print(selectedCategoryData)
    }
    @IBAction func pressShoppingViewBttn(_ sender: Any) {
        if shoppingViewBttn.image(for: .normal) == UIImage(named: "btnMakeShoppingMinus"){            shoppingViewBttn.setImage(UIImage(named: "btnMakeShoppingPlus"), for: .normal)
            numOfselected = numOfselected - 1
            TotalPlanData.shared.selectedCategory["shopping"] = false
            for (i, v) in selectedCategoryData.enumerated(){
                if v == 4{
                    selectedCategoryData.remove(at: i)
                }
            }
        }
        else{
            shoppingViewBttn.setImage(UIImage(named: "btnMakeShoppingMinus"), for: .normal)
            numOfselected = numOfselected + 1
            TotalPlanData.shared.selectedCategory["shopping"] = true
            selectedCategoryData.append(4)
        }
        /*전체 해제시 선택완료 버튼 비활성화*/
        if numOfselected == 0{
                   completeBttn.isEnabled = false
               }
               else{
                   completeBttn.isEnabled = true
               }
        selectedCategoryData.sort()
        print(selectedCategoryData)
    }
    @IBAction func pressActivityViewBttn(_ sender: Any) {
        if activityViewBttn.image(for: .normal) == UIImage(named: "btnMakeActivityMinus"){            activityViewBttn.setImage(UIImage(named: "btnMakeActivityPlus"), for: .normal)
            numOfselected = numOfselected - 1
            TotalPlanData.shared.selectedCategory["activity"] = false
            for (i, v) in selectedCategoryData.enumerated(){
                if v == 5{
                    selectedCategoryData.remove(at: i)
                }
            }
        }
        else{
            activityViewBttn.setImage(UIImage(named: "btnMakeActivityMinus"), for: .normal)
            numOfselected = numOfselected + 1
            TotalPlanData.shared.selectedCategory["activity"] = true
            selectedCategoryData.append(5)
        }
        /*전체 해제시 선택완료 버튼 비활성화*/
        if numOfselected == 0{
                   completeBttn.isEnabled = false
               }
               else{
                   completeBttn.isEnabled = true
               }
        selectedCategoryData.sort()
        print(selectedCategoryData)
    }
    
    
    @IBAction func showNextCategory(_ sender: Any) {
        let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        
        if let nextCategory = selectedCategoryData.first{
            
            if nextCategory == 0{
                let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                var tmpSelectedCategory = selectedCategoryData
                tmpSelectedCategory.remove(at: 0)
                vc.selectedCategoryData = tmpSelectedCategory
                vc.pgValue = numOfselected
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if nextCategory == 1{
                let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryFoodViewController") as! CategoryFoodViewController
                var tmpSelectedCategory = selectedCategoryData
                tmpSelectedCategory.remove(at: 0)
                vc.selectedCategoryData = tmpSelectedCategory
                vc.pgValue = numOfselected
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if nextCategory == 2{
                let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryDrinkViewController") as! CategoryDrinkViewController
                var tmpSelectedCategory = selectedCategoryData
                tmpSelectedCategory.remove(at: 0)
                vc.selectedCategoryData = tmpSelectedCategory
                vc.pgValue = numOfselected
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            if nextCategory == 3{
            let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryTransportViewController") as! CategoryTransportViewController
            var tmpSelectedCategory = selectedCategoryData
            tmpSelectedCategory.remove(at: 0)
            vc.selectedCategoryData = tmpSelectedCategory
            vc.pgValue = numOfselected
            self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if nextCategory == 4{
                let vc = storyboard?.instantiateViewController(withIdentifier: "CategoiryShoppingViewController") as! CategoiryShoppingViewController
                var tmpSelectedCategory = selectedCategoryData
                tmpSelectedCategory.remove(at: 0)
                vc.selectedCategoryData = tmpSelectedCategory
                vc.pgValue = numOfselected
                self.navigationController?.pushViewController(vc, animated: true)

            }
            
            if nextCategory == 5{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ActivityCellViewController") as! ActivityCellViewController
                var tmpSelectedCategory = selectedCategoryData
                tmpSelectedCategory.remove(at: 0)
                vc.selectedCategoryData = tmpSelectedCategory
                vc.pgValue = numOfselected
                self.navigationController?.pushViewController(vc, animated: true)

                
            }
            
            
            
        }
        
    }
    
    
    
    
    
    
    //다음뷰에 정보 넘기기
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //텍스트뷰로 받은 값 정수로 바꿔서 보내기
//        if segue.identifier == "temp"{
//            let vc = segue.destination as? MainViewController
//            vc?.pgValue = numOfselected//Int(temp!)!
//        }
//
//        //다음 segue destination navigation item 이름 바꾸기
//        let backItem = UIBarButtonItem()
//        backItem.title = ""
//        navigationItem.backBarButtonItem = backItem
//    }
    

}



