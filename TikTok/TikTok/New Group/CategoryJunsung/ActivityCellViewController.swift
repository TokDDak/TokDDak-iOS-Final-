//
//  ActivityCellViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/29.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class ActivityCellViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var numOfcell = 0
    var price = [92000,92000,92000,92000,92000,1111192000,92000,92000,92000,92000, 100000, 10000]
    var name2 = ["디즈니랜드1","디즈니랜드2","디즈니랜드3","디즈니랜드4","디즈니랜드5","디즈니랜드6","디즈니랜드7","디즈니랜드8","디즈니랜드9","디즈니랜드10", "에버랜드", "호우랜드"]
    var detail = ["디즈니랜드1","디즈니랜드2","디즈니랜드3","디즈니랜드4","디즈니랜드5","디즈니랜드6","디즈니랜드7","디즈니랜드8","디즈니랜드9","디즈니랜드10", "에버랜드", "호우랜드"]
    var selectedCategoryData : [Int] = []
    var pgValue : Int = 0
    var progressBarOffset : Int = 1
    var basePriceOfActivity = 0
    var baseCntOfActivity = 0
    
    
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
        myTableview.dataSource = self
        myTableview.delegate = self
        progressBar.progress = Float(progressBarOffset) * (Float(1.0 / Double(pgValue)))
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func endCategory(_ sender: Any) {
        
        //이제 다 끝났고, 다른 flow로 넘어가면 됨
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return price.count
       }
    

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mcell : ActivityCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! ActivityCellTableViewCell
        
           let mname : String = name2[indexPath.row]
        let mprice : String = String(price[indexPath.row].commaRepresentation)
        
        //selectedIndex가 row 번호를 가지고 있으면, Active버튼 아니면 Non-active
        let image: UIImage? =
            selectedIndex.contains(indexPath.row) ?
                UIImage(named: "btnSelectActive") :
                UIImage(named: "btnSelect")
        mcell.aSelect.setImage(image, for: .normal)
        
        //버튼의 tag에 indexPath.row주기
        mcell.aSelect.tag = indexPath.row
        mcell.aName.tag = indexPath.row
        
        mcell.aSelect.addTarget(self, action: #selector(ActivityCellViewController.oneTapped(_:)), for: .touchUpInside)

        mcell.aName.addTarget(self, action: #selector(ActivityCellViewController.seeDeatail(_:)), for: .touchUpInside)

        mcell.aImage?.image = UIImage(named: "makeImgDisney")
        mcell.aName.setTitle(mname, for: .normal)
        mcell.aPrice.text = mprice + " 원"
        
        mcell.clipsToBounds = true
        mcell.layer.masksToBounds = true
        mcell.layer.borderWidth = 2
        mcell.layer.shadowOffset = CGSize(width: -1, height: 1)
        mcell.layer.borderColor = CGColor.init(srgbRed: 255, green: 255, blue: 255, alpha: 100)
        
           return mcell
           
       }
    
    /*table view에 아이템 삭제*/
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            price.remove(at: indexPath.row)
//            name.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .bottom)
//        }
//    }
    
    @objc func seeDeatail(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "ActivityPopUpViewController") as! ActivityPopUpViewController
        print("sender.tag = \(sender.tag)")
        vc.priceOfActivity = price[sender.tag]
        vc.nameOfActivity = name2[sender.tag]
        vc.detailOfActivity = detail[sender.tag]
        present(vc, animated: true)
    }
    
    
    
    @objc func oneTapped(_ sender: UIButton) {
        let tag = sender.tag
        if selectedIndex.contains(tag) { // 재사용된 셀이 이미 선택이되서 active된 상태이면, 선택 해제된 셀을 재사용셀로 사용한다.
            sender.setImage(UIImage(named: "btnSelect"), for: .normal)
            basePriceOfActivity -= price[tag]
            baseCntOfActivity -= 1
            for (i, v) in selectedIndex.enumerated() {
                if v == tag {
                    selectedIndex.remove(at: i)
                }
            }
        } else { // 선택
            sender.setImage(UIImage(named: "btnSelectActive"), for: .normal)
            selectedIndex.append(tag)
            basePriceOfActivity += price[tag] //선택했을 때 가격 더해주는거
            baseCntOfActivity += 1 //갯수 더해주는거
        }
        totalPriceOfActivity.text = String(basePriceOfActivity.commaRepresentation)
        totalOfActivity.text = String(baseCntOfActivity)
    }
    
    func setupCompleteBtn() {
        completeBttn.isEnabled = selectedIndex.count != 0
    }

}
