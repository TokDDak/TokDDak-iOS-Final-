//
//  RegisterPlanViewController.swift
//  TikTok
//
//  Created by IJ . on 2020/01/01.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit


struct DayPlanData {
    
    var day: Int = 0
    var array2: [(Int, Int)]
    var dayCost: Int = 0
}

var cntDay: Int = 1
//데이 카운트

class RegisterPlanViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var registerPlanTableView: UITableView!
    @IBOutlet weak var buttonBarView: UIView!
    @IBOutlet weak var categoryItemCollectionView: UICollectionView!
    
    @IBOutlet weak var buttonBarViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dayViewLabel: UILabel!
    
    @IBOutlet weak var dayPriceLabel: UILabel!
    
    
    var imageDataArray: [UIImage] = [UIImage(named: "icStay")!, UIImage(named: "icFood")!, UIImage(named: "icSnacks")!, UIImage(named: "icActivity")!]
    
    var planArray: [String]?
    var stayArray = ["저가호텔", "일반호텔", "고급호텔", "최고급호텔"]
    var foodArray = ["간편식", "일반음식점", "고급음식점"]
    var snacksArray = ["카페", "디저트", "펍"]
    var activityArray = [""]
    
    var checkCategory: Int = 0
    
    var array: [(Int, Int)] = []
    
    var arrayNew: [(Int,Int,Int,Int)] = []
    
    
    var testData: [DayPlanData] = []
    
    var checkUpDown: Bool = true
    
    //var invidDayData: [DayPlanData] = []
    var dataSet = [DayPlanData]()
    
    
    
       
    //---------------------딕셔너리 배열화 ----------
    var foodCntValue : [Int] = [0,0,0]
       //간편(0) 일발(1) 고급(2)
    var foodCostValue : [Int] = [0,0,0]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var test : [Int] = []
        test.append(0)
        
        print("테스트: \(test) ")
      
        for i in 0...(TotalPlanData.shared.travelDays-1) {
            dataSet.append(DayPlanData(day: i, array2: [], dayCost: 0))
        }
        print(dataSet)
        
        self.buttonBarView.backgroundColor = UIColor(patternImage: UIImage(named: "imgRound")!)
        
        self.registerPlanTableView.dataSource = self
        self.registerPlanTableView.delegate = self
        self.categoryItemCollectionView.dataSource = self
        self.categoryItemCollectionView.delegate = self
        
        registerPlanTableView.separatorStyle = .none
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 30, height: 36)
        layout.scrollDirection = .horizontal
        categoryItemCollectionView.collectionViewLayout = layout
        
        
        
        
         setData()
        
        print(TotalPlanData.shared.totalCountOfFood)
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        
        //let selectedHotels = TotalPlanData.shared.totalDayOfHotel.filter { $0.value != 0 }.map { $0.key.name }
//        if TotalPlanData.shared.selectedCategory["hotel"] == true{
//            for (key, value) in TotalPlanData.shared.totalDayOfHotel.sorted(by: { $0.key < $1.key }) {
//
//                if value == 0  {
//                    switch key {
//                    case .high: if stayArray.contains("최고급호텔") { stayArray.remove(at: 0) }
//                    case .middle: if stayArray.contains("고급호텔") { stayArray.remove(at: 1) }
//                    case .low: if stayArray.contains("일반호텔") { stayArray.remove(at: 2) }
//                    case .apartment: if stayArray.contains("아파트") { stayArray.remove(at: 3) }
//                    default:
//                        stayArray.append("")
//                    }
//                }
//
//            }
//        } else {
//            stayArray = [""]
//        }
//
//        if TotalPlanData.shared.selectedCategory["restaurant"] == true{
//
//
//            for (key, value) in TotalPlanData.shared.totalCountOfFood{
//                foodCntValue[key] = value
//            }
//
//            //var totalCntIdx : [Int] = []
//            var totalCntValue : [Int] = []
//               //간편(0) 일발(1) 고급(2)
//            var totalCostValue : [Int] = []
//
//
//            // 간편, 일반, 고급에 대한 갯수 배열 순서대로
//
//            for (i, v) in foodCntValue.enumerated(){
//                if v == 0 {
//                    foodArray.remove(at: i)
//                }
//
//            }
//
//        } else {
//            foodArray = [""]
//        }
//
//        if TotalPlanData.shared.selectedCategory["drink"] == true {
//            for (key, value) in TotalPlanData.shared.totalCountOfDrink.sorted(by: { $0.key < $1.key }) {
//                if value == 0  {
//                    switch key {
//                    case 0: if snacksArray.contains("카페"){ snacksArray.remove(at: 0) }
//                    case 1: if snacksArray.contains("디저트"){ snacksArray.remove(at: 1) }
//                    case 2: if snacksArray.contains("펍바"){ snacksArray.remove(at: 2) }
//                    default:
//                        snacksArray.append("")
//                    }
//                }
//
//            }
//
//        }else {
//            snacksArray = [""]
//        }
        
        
        for (key, value) in TotalPlanData.shared.activityNamePrice {
            activityArray.append(key)
            // price는 array키로
            // ""들어간건 배열 갯수 카운트해서 2개이상이면 index 0 을 삭제시키면 됨
        }
        
        
    }
    
//
//    func findValue(itemName : String) -> Int{
//        for (i, v) in foodArray.enumerated(){
//            if(v == itemName){
//                return i
//            }
//        }
//    }
    
    
    @IBAction func touchUpStay(_ sender: Any) {
        checkCategory = 0
        categoryItemCollectionView.reloadData()
    }
    
    @IBAction func touchUpFood(_ sender: Any) {
        checkCategory = 1
        categoryItemCollectionView.reloadData()
    }
    @IBAction func touchUpSnacks(_ sender: Any) {
         print("세번째 카테고리 호출")
        checkCategory = 2
        categoryItemCollectionView.reloadData()
    }
    
    @IBAction func touchUpActivity(_ sender: Any) {
        checkCategory = 3
        categoryItemCollectionView.reloadData()
    }
    
    
    @IBAction func touchUpPlusDay(_ sender: Any) {
        cntDay += 1
        self.dayViewLabel.text = "Day \(cntDay)"
        
        dataSet[cntDay-1].day = cntDay
        self.registerPlanTableView.reloadData()
        
        self.dayPriceLabel.text = "\(dataSet[cntDay-1].dayCost)"
        
        
    }
    
   
    @IBAction func touchMinusDay(_ sender: Any) {
       if( cntDay > 0 ){
            cntDay -= 1
        }
        self.dayViewLabel.text = "Day \(cntDay)"
        
        dataSet[cntDay-1].day = cntDay
        self.registerPlanTableView.reloadData()
        
         self.dayPriceLabel.text = "\(dataSet[cntDay-1].dayCost)"
    }
    
    func insertPlanTableView() {
        
        let indexPath = IndexPath(row: dataSet[cntDay-1].array2.count-1, section: 0)
        //마지막 데이터 indexPath를 추가하기 위한 코드 , 데이터3개면 카운트3 but indexPath는 0,1,2 순이므로
        //또한 맨처음엔 데이터가 없기때문에 indexPath가 없어서 이 코드가 필요
        registerPlanTableView.beginUpdates()
        registerPlanTableView.insertRows(at: [indexPath], with: .bottom)
        registerPlanTableView.endUpdates()
    }
    // array를 먼저 추가하고 dummyAction으로 데이터 삽입.
    
  
    
    
    // table view에 아이템 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            var thisCount:Int = dataSet[cntDay-1].array2.count-1
            
            
            
            var findString: String = ""
            
           if dataSet[cntDay-1].array2.count > 0 {
            if( dataSet[cntDay-1].array2[thisCount].0 == 0){
              
                findString = stayArray[dataSet[cntDay-1].array2[thisCount].1]
                
                dataSet[cntDay-1].dayCost -= TotalPlanData.shared.invidCostOfHotel[findString]!
            }
            if( dataSet[cntDay-1].array2[thisCount].0 == 1){
                
                dataSet[cntDay-1].dayCost -= TotalPlanData.shared.invidCostOfFood[dataSet[cntDay-1].array2[thisCount].1]!
            }
            if( dataSet[cntDay-1].array2[thisCount].0 == 2){
             
                dataSet[cntDay-1].dayCost -= TotalPlanData.shared.invidCostOfDrink[dataSet[cntDay-1].array2[thisCount].1]!
            }
            if( dataSet[cntDay-1].array2[thisCount].0 == 3){
              
                findString = activityArray[dataSet[cntDay-1].array2[thisCount].1]
                
                
                dataSet[cntDay-1].dayCost -= TotalPlanData.shared.activityNamePrice[findString]!
                
            }
            }
            
            
             dataSet[cntDay-1].array2.remove(at: thisCount)
             dayPriceLabel.text = "\(dataSet[cntDay-1].dayCost)"
            
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
            
        }
    }
    
    @IBAction func touchUpDownButton(_ sender: Any) {
        
        
        if checkUpDown {
            buttonBarViewBottomConstraint.constant += buttonBarView.bounds.height - 68
            
        } else {
            buttonBarViewBottomConstraint.constant -= buttonBarView.bounds.height - 68
            
            
            
        }
        UIView
            .animate(withDuration: 0.5,
                     delay: 0,
                     usingSpringWithDamping: 0.88,
                     initialSpringVelocity: 1,
                     options: .curveEaseInOut,
                     animations: {
                        self.view.layoutIfNeeded()
            },
                     completion: { _ in self.checkUpDown.toggle() })
    }
}

extension RegisterPlanViewController: UITableViewDelegate{
    
}

extension RegisterPlanViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return array.count 원래 1차원 배열 카운트
        print("dataSet 출력 \(dataSet[cntDay-1].array2.count)")
        return dataSet[cntDay-1].array2.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        print("함수 cellForRowAt 호출")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterPlanCell", for: indexPath) as? registerPlanTableViewCell else{
            return UITableViewCell()
        }
        
        
        
        if( dataSet[cntDay-1].array2[indexPath.row].0 == 0){
            cell.categoryIconImageView.image = imageDataArray[0]
            cell.categoryLabel.text = stayArray[dataSet[cntDay-1].array2[indexPath.row].1]
            
          //  dataSet[cntDay-1].dayCost += TotalPlanData.shared.invidCostOfHotel[cell.categoryLabel.text!]!
        }
        if( dataSet[cntDay-1].array2[indexPath.row].0 == 1){
            cell.categoryIconImageView.image = imageDataArray[1]
            cell.categoryLabel.text = foodArray[dataSet[cntDay-1].array2[indexPath.row].1]
            
           // dataSet[cntDay-1].dayCost += TotalPlanData.shared.invidCostOfFood[dataSet[cntDay-1].array2[indexPath.row].1]!
        }
        if( dataSet[cntDay-1].array2[indexPath.row].0 == 2){
            cell.categoryIconImageView.image = imageDataArray[2]
            cell.categoryLabel.text = snacksArray[dataSet[cntDay-1].array2[indexPath.row].1]
            
         //   dataSet[cntDay-1].dayCost += TotalPlanData.shared.invidCostOfDrink[dataSet[cntDay-1].array2[indexPath.row].1]!
        }
        if( dataSet[cntDay-1].array2[indexPath.row].0 == 3){
            cell.categoryIconImageView.image = imageDataArray[3]
            cell.categoryLabel.text = activityArray[dataSet[cntDay-1].array2[indexPath.row].1]
            
            
           // dataSet[cntDay-1].dayCost += TotalPlanData.shared.activityNamePrice[cell.categoryLabel.text!]!
           
           
            
        }
        
        
       //  dayPriceLabel.text = "\(dataSet[cntDay-1].dayCost)"
        
        
        
        return cell
        
    }
}

extension RegisterPlanViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(checkCategory == 0){
            if stayArray.count == 0{
                return 0
            }
            return stayArray.count
        }
        if(checkCategory == 1){
            return foodArray.count
        }
        if(checkCategory == 2){
            return snacksArray.count
        }
        if(checkCategory == 3){
            return activityArray.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemCell", for: indexPath) as? categoryItemCollectionViewCell else { return UICollectionViewCell() }
        
        
        
        if(checkCategory == 0){
            cell.itemLabel.text = stayArray[indexPath.row]
        }
        if(checkCategory == 1){
            cell.itemLabel.text = foodArray[indexPath.row]
        }
        if(checkCategory == 2){
            cell.itemLabel.text = snacksArray[indexPath.row]
        }
        if(checkCategory == 3){
            cell.itemLabel.text = activityArray[indexPath.row]
        }
        
        //        if DayPlanModel.day == 1 {
        //            cell.itemLabel.text = DayPlanModel[0].content
        //        }
        
        
        return cell
    }
    
    
}

extension RegisterPlanViewController: UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
      //  print(checkCategory)
        
        //self.invidDayData[cntDay].append(cntDay,(checkCategory,indexPath.row),0)
//        invidDayData[].day = cntDay
//        invidDayData[].array2.append((checkCategory, indexPath.row))
//        invidDayData[].dayCost = 0
        
        //self.arrayNew.append((cntDay-1,checkCategory,indexPath.row,15000))
       
        dataSet[cntDay-1].array2.append((checkCategory, indexPath.row))
        print("data Set\(dataSet[cntDay-1])")
        
        
        
//        for (key, value) in TotalPlanData.shared.totalCountOfFood{
//
//        }
        
        
        //        self.array.append((checkCategory, indexPath.row))
        //        print(array[0].1)
        var findString: String = ""
        print("array2: \(dataSet[cntDay-1].array2)")
        print("collectionview indexPath.row \(indexPath.row)")
        
        var thisCount:Int = dataSet[cntDay-1].array2.count-1
        
        if dataSet[cntDay-1].array2.count > 0 {
        if( dataSet[cntDay-1].array2[thisCount].0 == 0){
          
            findString = stayArray[dataSet[cntDay-1].array2[thisCount].1]
            
            dataSet[cntDay-1].dayCost += TotalPlanData.shared.invidCostOfHotel[findString]!
        }
        if( dataSet[cntDay-1].array2[thisCount].0 == 1){
            
            dataSet[cntDay-1].dayCost += TotalPlanData.shared.invidCostOfFood[dataSet[cntDay-1].array2[thisCount].1]!
        }
        if( dataSet[cntDay-1].array2[thisCount].0 == 2){
         
            dataSet[cntDay-1].dayCost += TotalPlanData.shared.invidCostOfDrink[dataSet[cntDay-1].array2[thisCount].1]!
        }
        if( dataSet[cntDay-1].array2[thisCount].0 == 3){
          
            findString = activityArray[dataSet[cntDay-1].array2[thisCount].1]
            
            
            dataSet[cntDay-1].dayCost += TotalPlanData.shared.activityNamePrice[findString]!
            
        }
        }
        
        
        dayPriceLabel.text = "\(dataSet[cntDay-1].dayCost)"
        
        
        self.insertPlanTableView()
        
        
        
        
    }
    
    
    
}
