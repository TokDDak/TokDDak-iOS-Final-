//
//  PopularCityTableViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/31.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PopularCityTableViewController: UITableViewController , IndicatorInfoProvider {
    
    var childNumber: String = ""
    var twoDimensionalArray = [
        ([ "서울" , "makeBtnPopularSeoul"]),
        (["뉴욕", "makeBtnPopularNewyork"]),
        (["홍콩", "makeBtnPopularHongkong"]),
        (["마카오", "makeBtnPopularMacao"]),
        (["블라디보스톡", "makeBtnPopularVladivostok"]),
        (["런던", "makeBtnPopularLondon"]),
        (["파리", "makeBtnPopularParis"]),
        (["세부", "makeBtnPopularCebu"]),
        (["대만", "makeBtnPopularTaipei"]),
        (["취리히", "makeBtnPopularZurich"]),
        (["보라카이", "makeBtnPopularBoracay"]),
        (["다낭", "makeBtnPopularDanang"])
        
    ]
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "\(childNumber)")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        print(twoDimensionalArray[0][1])
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return twoDimensionalArray.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
    
        TotalPlanData.shared.cityName = twoDimensionalArray[indexPath.row][0]
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "GoToVC") as? GoToCityViewController
            else {
                return
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCityCell", for: indexPath) as? PopularCityTableViewCell else{
               return UITableViewCell()
           }

        cell.popularCityImageView.image =  UIImage(named: "\(twoDimensionalArray[indexPath.row][1])")
         
           
           return cell
       }

   

}
