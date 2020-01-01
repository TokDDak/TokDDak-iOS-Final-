//
//  CityChooseTableViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/28.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import TinyConstraints

class CityChooseTableViewController: UITableViewController, IndicatorInfoProvider {
    
    
    
    static var userCheckSection: Int = 0
    static var userCheckrow: Int = 0
    
    
    var childNumber: String = ""
    
    var twoDimensionalArray = [
        ExpandableNames(isExpanded: false, country: "프랑스" , cities:  [ "Amy", "Jimmy", "John", "aasdf" , "bbb", "aa"]),
        ExpandableNames(isExpanded: false, country: "독일" , cities:  ["busan", "hongdae" , "ys" , "Ij"]),
        ExpandableNames(isExpanded: false, country: "스페인" , cities:  [ "Amy", "Jimmy", "John", "aasdf" , "bbb", "aa"]),
        ExpandableNames(isExpanded: false, country: "스위스" , cities:  ["12412an", "ho253ngdae" , "yyyyy" , "pppp"])
        
    ]
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "\(childNumber)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
      
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.instantiate(CityChooseSection.self)
        headerView.foldButton.tag = section
        
        headerView.configure(with:  twoDimensionalArray[section].country)
        headerView.delegate = self
        return headerView
//
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
//        headerView.backgroundColor = .lightGray
//
//        let country = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        country.text = twoDimensionalArray[section].country
//        country.textAlignment = .center
//        country.backgroundColor = .cyan
//        country.width(100)
//
//
//        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
//        button.setImage(UIImage(named: "naviBtnBackB"), for: .normal)
//        button.setImage(UIImage(named: "cursor"), for: .selected)
//        button.backgroundColor = .clear
//        button.tintColor = .black
//
//        button.width(50)
//        button.height(50)
//        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
//
//        button.tag = section
//
//        headerView.addSubview(country)
//        headerView.addSubview(button)
//        let underline = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
//        headerView.addSubview(underline)
//        underline.backgroundColor = .black
//        country.leadingToSuperview()
//        country.centerYToSuperview()
//        button.trailingToSuperview()
//        button.centerYToSuperview()
//        underline.height(1)
//        underline.trailingToSuperview()
//        underline.leadingToSuperview()
//        underline.bottomToSuperview()
//
//        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("섹션값 \(indexPath.section)")
        print("로우값 \(indexPath.row)")
        CityChooseTableViewController.userCheckSection = indexPath.section
        CityChooseTableViewController.userCheckrow = indexPath.row
        print("\(indexPath.row)")
        print("\(twoDimensionalArray[indexPath.section].cities[indexPath.row])")
        
        TravelData.userChooseCity = twoDimensionalArray[indexPath.section].cities[indexPath.row]
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "GoToVC") as? GoToCityViewController
            else {
                return
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
    
    @objc func handleExpandClose(button: UIButton) {
        let section = button.tag
        button.isSelected = !button.isSelected
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].cities.indices{
            print(0,row)
            let indexPath = IndexPath(row: row, section:  section)
            indexPaths.append(indexPath)
            
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        
        twoDimensionalArray[section].isExpanded = !isExpanded
        
//        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        if isExpanded{
            
            tableView.deleteRows(at: indexPaths, with: .fade)
            
        } else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if !twoDimensionalArray[section].isExpanded {
            return 0
        }
        
        
        return twoDimensionalArray[section].cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else{
            return UITableViewCell()
        }
        let name = twoDimensionalArray[indexPath.section].cities[indexPath.row]
        cell.cityLabel.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    // 맨밑에 CityCell- tableViewCell Class 있음.
}

extension CityChooseTableViewController: CityChooseSectionDelegate {
    func cityChooseSection(_ view: UIView, didSelectButton button: UIButton) {
        handleExpandClose(button: button)
    }
}

class CityCell: UITableViewCell {

    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentsView.layer.borderColor = UIColor(red: 102 / 255, green: 102 / 255, blue: 102 / 255, alpha: 0.5).cgColor
        contentsView.layer.cornerRadius = 3
        contentsView.layer.borderWidth = 1.0
    }
    
}
