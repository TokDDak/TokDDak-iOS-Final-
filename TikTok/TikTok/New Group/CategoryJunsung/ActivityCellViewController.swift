//
//  ActivityCellViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

typealias ActivityCellModel = _CityActivityResponseModel

class ActivityCellViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedCategoryData : [Int] = []
    var pgValue : Int = 0
    var progressBarOffset : Int = 1
    var basePriceOfActivity = 0
    
    var responseModel: [ActivityCellModel]? {
        didSet {
            myTableview.reloadData()
        }
    }
    
    var selectedIndex: [Int] = [] {
        didSet {
            setupCompleteBtn()
        }
    }
    
    @IBOutlet weak var completeBttn: UIButton!
    @IBOutlet weak var myTableview: UITableView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var totalOfActivity: UILabel!
    @IBOutlet weak var totalPriceOfActivity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableview.separatorStyle = .none
        myTableview.dataSource = self
        myTableview.delegate = self
        totalPriceOfActivity.text = basePriceOfActivity.commaRepresentation
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let cityID = 1
        APIService.shared.requestCityActivity(cityID: cityID) { [weak self] result in
            switch result {
            case let .success(success):
                guard let data = success.data else { return }
                self?.responseModel = data
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func endCategory(_ sender: Any) {
        
        var myData = TripCreateRequestModel.init(title: TotalPlanData.shared.travelName,
                                                 start: TotalPlanData.shared.startDate,
                                                 end: TotalPlanData.shared.endDate,
                                                 activityBudget: TotalPlanData.shared.totalCostOfActivity,
                                                 hotelBudget: TotalPlanData.shared.totalCostOfHotel.reduce(0) { $0 + $1.value },
                                                 foodBudget: TotalPlanData.shared.totalCostOfFood.reduce(0) { $0 + $1.value },
                                                 shoppingBudget: totalCostOfShopping,
                                                 snackBudget: TotalPlanData.shared.totalCostOfDrink.reduce(0) { $0 + $1.value },
                                                 transportBudget: totalCostOfShopping,
                                                 userID: 1)
        
        
        APIService.shared.requestTripCreate(cityID: 1, requestModel: myData) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case let .success(success):
                guard let data = success.data else {return}
    
                TotalPlanData.shared.startDate = data.start
                TotalPlanData.shared.endDate = data.end
                

            case let .failure(error):
                print("실패")
                print(error.localizedDescription)
            }
        }
        //            print(result)
        //이제 다 끝났고, 다른 flow로 넘어가면 됨
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "totalBudgetViewController") as! totalBudgetViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return price.count
        return responseModel?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mcell : ActivityCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! ActivityCellTableViewCell
        mcell.delegate = self
        guard let model = responseModel?[indexPath.row] else { return UITableViewCell() }
        mcell.configure(with: model, tag: indexPath.row, isSelected: selectedIndex.contains(indexPath.row))
        return mcell
        
    }
    
    func setupCompleteBtn() {
        completeBttn.isEnabled = selectedIndex.count != 0
    }
    
}

extension ActivityCellViewController: ActivityCellTableViewCellDelegate {
    func activityCell(_ cell: ActivityCellTableViewCell, didTapNameButton button: UIButton) {
        guard let model = responseModel?[button.tag] else { return }
        let vc = storyboard?.instantiateViewController(identifier: "ActivityPopUpViewController") as! ActivityPopUpViewController
        print("sender.tag = \(button.tag)")
        vc.priceOfActivity = model.cost
        vc.nameOfActivity = model.name
        vc.detailOfActivity = model.content
        vc.mrtURL = URL(string: model.urlMRT)!
        vc.klURL = URL(string: model.urlKL)!
        present(vc, animated: true)
    }
    
    func activityCell(_ cell: ActivityCellTableViewCell, didTapSelectButton button: UIButton) {
        let tag = button.tag
        guard let model = responseModel?[button.tag] else { return }
        if selectedIndex.contains(tag) { // 재사용된 셀이 이미 선택이되서 active된 상태이면, 선택 해제된 셀을 재사용셀로 사용한다.
            button.setImage(UIImage(named: "btnSelect"), for: .normal)
            TotalPlanData.shared.totalCostOfActivity -= model.cost
            basePriceOfActivity -= model.cost
            TotalPlanData.shared.totalCountOfActivity -= 1
            TotalPlanData.shared.activityNamePrice[model.name] = model.cost
            TotalPlanData.shared.activityNamePrice.removeValue(forKey: model.name)
//            for (i, v) in selectedIndex.enumerated() {
//                if v == tag {
//                    selectedIndex.remove(at: i)
//                }
//            }
        } else { // 선택
            button.setImage(UIImage(named: "btnSelectActive"), for: .normal)
            selectedIndex.append(tag)
            TotalPlanData.shared.totalCostOfActivity += model.cost
            basePriceOfActivity += model.cost //선택했을 때 가격 더해주는거
            TotalPlanData.shared.totalCountOfActivity += 1 //갯수더해주는거
            TotalPlanData.shared.activityNamePrice[model.name] = model.cost
            
        }
        totalPriceOfActivity.text = String(basePriceOfActivity.commaRepresentation)
        totalOfActivity.text = String(TotalPlanData.shared.totalCountOfActivity)
    }
}
