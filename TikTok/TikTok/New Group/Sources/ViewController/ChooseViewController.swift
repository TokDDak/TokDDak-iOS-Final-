//
//  ChooseViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/27.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChooseViewController:  ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        self.settings.style.buttonBarItemBackgroundColor = UIColor.white
        self.settings.style.buttonBarItemTitleColor = UIColor.init(red: 213.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1)
        //선택된거 검은색 없음
        self.settings.style.buttonBarBackgroundColor = UIColor.white
//            UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
        
        self.settings.style.selectedBarBackgroundColor = UIColor.init(red: 19.0/255.0, green: 139.0/255.0, blue: 255.0/255.0, alpha: 1)
        self.settings.style.selectedBarHeight = 2.0
        
        
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor.init(red: 213.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1)
            newCell?.label.textColor = UIColor.black
            
           
        }
        
        
        
        
        
        
        super.viewDidLoad()
        
        
        
       
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child1 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "PopularCityVC") as! PopularCityTableViewController
        child1.childNumber = "인기 여행지"
        
        let child2 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child2.childNumber = "유럽"
        
        let child3 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child3.childNumber = "동남아시아"
        
        let child4 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child4.childNumber = "동아시아"
        
        let child5 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child5.childNumber = "아메리카"
        
        let child6 = UIStoryboard.init(name: "InjunStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CityChooseTableVC") as! CityChooseTableViewController
        child6.childNumber = "오세아니아"
        
        
        return [child1, child2, child3, child4, child5, child6]
    }
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
  
    
}
