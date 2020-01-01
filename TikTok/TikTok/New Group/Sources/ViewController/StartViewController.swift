//
//  StartViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var startScrollView: UIScrollView!
    @IBOutlet weak var popularCityCollectionView: UICollectionView!
    @IBOutlet weak var airPlaneImageView: UIImageView!
    var animationDuration: TimeInterval = 0.6
    let toDelayTime = 1.0
    
    @IBOutlet weak var topView: UIView!
    
    var numberOfCell: Int = 6 // 이미지 배열 개수랑, 같이 숫자 변경
    let cellIdentifier: String = "cell"
    let popularCityImages = [UIImage(named: "btnPopularParis"), UIImage(named: "btnPopularSebu"), UIImage(named: "btnPopularNewyork"), UIImage(named: "btnPopularTokyo"), UIImage(named: "btnPopularDanang")
    , UIImage(named: "btnPopularTaipei")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.topView.backgroundColor = UIColor(red: 19.00/255.0, green: 139.00/255.0, blue: 255.00/255.0, alpha: 1.00)
        //self.view.sendSubviewToBack(self.airPlaneImageView)
        //뷰 맨뒤로
       // self.navigationController?.navigationBar.barTintColor = UIColor(red: 19.00/255.0, green: 139.00/255.0, blue: 255.00/255.0, alpha: 1.00)
        
        //navigationBar 반투명 false
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        //navigationBar 경계선 없애는 작업
        
        
        popularCityCollectionView.contentInset = .init(top: 0, left: 30, bottom: 0, right: 30)
        //inset으로 셀 공간 조정
        
       
        
//       func scrollViewDidScroll(scrollView: UIScrollView) {
//           if startScrollView.contentOffset.y < 0 {
//               startScrollView.contentOffset.y = 0
//           }
//       }
        
        // Do any additional setup after loading the view.
    }
  
    
    
    @IBAction func testButton(_ sender: Any) {
        
    }
    @IBAction func touchUpTravelBefore(_ sender: Any) {
        print("test")
    }
    
    @IBAction func touchUpTravelIng(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TravelingVC") as? TravelingViewController
            else {
                return
        }
        
        self.navigationController?.pushViewController(nextVC, animated: false)
        
    }
    
    @IBAction func touchUpLetsGo(_ sender: UIButton) {
        sender.isEnabled = false
        UIView.animate(withDuration: animationDuration,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                    self.airPlaneImageView.alpha = 0
                    self.airPlaneImageView.transform =
                        self.airPlaneImageView.transform.translatedBy(x: 100, y: -200)
        //            self.airPlaneImageView.transform = .identity
        }, completion: { finished in
            sender.isEnabled = true
            if finished {
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseTravel") as? ChooseViewController
                        else {
                            return
                    }
                    //인스턴트 뷰 컨트롤러에 let 안붙이면 에러
                    self.navigationController?.pushViewController(nextVC, animated: true)
                self.airPlaneImageView.transform = .identity
                self.airPlaneImageView.alpha = 1
            }
        })
        
        
//        print("ing")
//        perform(#selector(delayedFunction), with: nil, afterDelay: toDelayTime)
//        animate2()
//
//
//
//
        
    }
    
    @objc func delayedFunction() {
        print("This message is delayed")
        //여기부분에 다음 뷰컨 넘어가는 코드 쓰면됨
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseTravel") as? ChooseViewController
            else {
                return
        }
        //인스턴트 뷰 컨트롤러에 let 안붙이면 에러
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    func animate2() {
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.airPlaneImageView.alpha = 0
            self.airPlaneImageView.transform =
                self.airPlaneImageView.transform.translatedBy(x: 100, y: -200)
//            self.airPlaneImageView.transform = .identity
        }  )
        //비행기 오른쪽 대각선
        
        
        
        //        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
        //                                             self.airPlaneImageView.alpha = 1
        //                                             self.airPlaneImageView.transform =
        //                                                self.airPlaneImageView.transform.translatedBy(x: -100, y: 200)
        //                                         }  )
        //비행기 원래 위치로 돌리기
        
    }
    
    
   
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension StartViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        if let cityCell = cell as? PopularCityCollectionViewCell {
            cityCell.configure(with: popularCityImages[indexPath.item]!)
        }
        
        return cell
    }
    
       
       
       
}

extension StartViewController: UICollectionViewDelegate {
    
    
}
