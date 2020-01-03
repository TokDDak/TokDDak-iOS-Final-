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
    var array2: [(Int, Int)] = []
    var dayCost: Int = 0
    struct plan {
        var category: Int
        var categoryNumber: Int
        var cost: Int
    }
}

class RegisterPlanViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var registerPlanTableView: UITableView!
    @IBOutlet weak var buttonBarView: UIView!
    @IBOutlet weak var categoryItemCollectionView: UICollectionView!
    
    @IBOutlet weak var buttonBarViewBottomConstraint: NSLayoutConstraint!
    
    
    
    var imageDataArray: [UIImage] = [UIImage(named: "icStay")!, UIImage(named: "icFood")!, UIImage(named: "icSnacks")!, UIImage(named: "icActivity")!]
    
    var planArray: [String]?
    var stayArray = ["최고급호텔", "고급호텔", "일반호텔", "아파트"]
    var foodArray = ["고급음식점", "일반음식점", "간편식"]
    var snacksArray = ["카페", "디저트", "펍바"]
    var activityArray = ["서핑","배타기"]
    
    var checkCategory: Int = 0
    
    var array: [(Int, Int)] = []
    
    
    var testData: [DayPlanData] = []
    
    var checkUpDown: Bool = true
    
    var dayData: [DayPlanModel] = []
    
       
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        
        dayData.append(DayPlanModel(day: 1, cost: 123, category: "asdf", content: "asdf", TripId: 1))
        
        setData()
        
        print(TotalPlanData.shared.totalCountOfFood)
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        
        //let selectedHotels = TotalPlanData.shared.totalDayOfHotel.filter { $0.value != 0 }.map { $0.key.name }
        if TotalPlanData.shared.selectedCategory["hotel"] == true{
            for (key, value) in TotalPlanData.shared.totalDayOfHotel.sorted(by: { $0.key < $1.key }) {
                
                if value == 0  {
                    switch key {
                    case .high: if stayArray.contains("최고급호텔") { stayArray.remove(at: 0) }
                    case .middle: if stayArray.contains("고급호텔") { stayArray.remove(at: 1) }
                    case .low: if stayArray.contains("일반호텔") { stayArray.remove(at: 2) }
                    case .apartment: if stayArray.contains("아파트") { stayArray.remove(at: 3) }
                    default:
                        stayArray.append("")
                    }
                }
                
            }
        } else {
            stayArray = [""]
        }
        
        if TotalPlanData.shared.selectedCategory["restaurant"] == true{
            
            //var totalCntIdx : [Int] = []
            var totalCntValue : [Int] = []
               //간편(0) 일발(1) 고급(2)
            var totalCostValue : [Int] = []
       
            for i in 0...3{
                totalCntValue[i] = TotalPlanData.shared.totalCountOfFood[i]!
                totalCostValue[i] =
                    TotalPlanData.shared.totalCostOfFood[i]!
            }
            // 간편, 일반, 고급에 대한 갯수 배열 순서대로
            
            for (i, v) in totalCntValue.enumerated(){
                if v == 0{
                    foodArray.remove(at: i)
                }
            }
            
            
            
  
            
            
            
            
            for (key, value) in TotalPlanData.shared.totalCountOfFood /*.sorted(by: { $0.key < $1.key }) */{
                if value == 0  {
                    switch key { // index 에러 있음
                    case 0: if foodArray.contains("고급음식점"){ foodArray.remove(at: 0) }
                    case 1: if foodArray.contains("일반음식점"){ foodArray.remove(at: 1) }
                    case 2: if foodArray.contains("간편식"){ foodArray.remove(at: 2) }
                    default:
                        foodArray.append("")
                    }
                }
                
            }
        } else {
            foodArray = [""]
        }
        
        if TotalPlanData.shared.selectedCategory["drink"] == true {
            for (key, value) in TotalPlanData.shared.totalCountOfDrink.sorted(by: { $0.key < $1.key }) {
                if value == 0  {
                    switch key {
                    case 0: if snacksArray.contains("카페"){ snacksArray.remove(at: 0) }
                    case 1: if snacksArray.contains("디저트"){ snacksArray.remove(at: 1) }
                    case 2: if snacksArray.contains("펍바"){ snacksArray.remove(at: 2) }
                    default:
                        snacksArray.append("")
                    }
                }
                
            }
            
        }else {
            snacksArray = [""]
        }
        
        
        for (key, value) in TotalPlanData.shared.activityNamePrice {
            activityArray.append(key)
            // price는 array키로
        }
        
        print("setData 끝부분 호출")
        
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
        checkCategory = 2
        categoryItemCollectionView.reloadData()
    }
    
    @IBAction func touchUpActivity(_ sender: Any) {
        checkCategory = 3
        categoryItemCollectionView.reloadData()
    }
    
    func insertPlanTableView() {
        let indexPath = IndexPath(row: array.count-1, section: 0)
        //마지막 데이터 indexPath를 추가하기 위한 코드 , 데이터3개면 카운트3 but indexPath는 0,1,2 순이므로
        //또한 맨처음엔 데이터가 없기때문에 indexPath가 없어서 이 코드가 필요
        registerPlanTableView.beginUpdates()
        registerPlanTableView.insertRows(at: [indexPath], with: .bottom)
        registerPlanTableView.endUpdates()
    }
    // array를 먼저 추가하고 dummyAction으로 데이터 삽입.
    
    @IBAction func dummyDataAction(_ sender: Any) {
        
        self.array.append((checkCategory, 1))
        
    }
    
    
    // table view에 아이템 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            print(array)
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
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterPlanCell", for: indexPath) as? registerPlanTableViewCell else{
            return UITableViewCell()
        }
        
        
        if( checkCategory == 0){
            cell.categoryIconImageView.image = imageDataArray[0]
            cell.categoryLabel.text = stayArray[array[indexPath.row].1]
        }
        if( checkCategory == 1){
            cell.categoryIconImageView.image = imageDataArray[1]
            cell.categoryLabel.text = foodArray[array[indexPath.row].1]
            
        }
        if( checkCategory == 2){
            cell.categoryIconImageView.image = imageDataArray[2]
            cell.categoryLabel.text = snacksArray[array[indexPath.row].1]
        }
        if( checkCategory == 3){
            cell.categoryIconImageView.image = imageDataArray[3]
            cell.categoryLabel.text = activityArray[array[indexPath.row].1]
        }
        
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
        
        print(indexPath)
        print(checkCategory)
        
        
        self.array.append((checkCategory, indexPath.row))
        print(array[0].1)
        
        self.insertPlanTableView()
        
        
    }
    
    
    
}
