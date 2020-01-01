//
//  ViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

protocol sendBackDelegate {
    func dataReceived(data: String, hotelNum: Int, day: Int)
}



class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var UpView: UIView!
    @IBOutlet weak var sleepDay: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var avgPriceLabel: UILabel!
    
    
    @IBOutlet weak var firstInfoName: UILabel!
    @IBOutlet weak var secondInfoName: UILabel!
    @IBOutlet weak var thirdInfoName: UILabel!
    @IBOutlet weak var firstInfoPrice: UILabel!
    @IBOutlet weak var secondInfoPrice: UILabel!
    @IBOutlet weak var thirdInfoPrice: UILabel!
    
    var chk : Int = 0
    
    var hotelNum = 0
    var Day = 1
    var avgPrice = 250000
    var totalP = 250000
    var sendData = "" // data 전달을 위한 sendData
    var delegate : sendBackDelegate? // data 전달을 위한 delegate 선언
    var nameOfHotel : String = ""
    @IBOutlet weak var entireView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var hotelName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelName.text = nameOfHotel
        
        //전체 뷰 radius
        self.entireView.round(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], cornerRadius: 15)
        // Do any additional setup after loading the view.
        sleepDay.text = "1 박"
        avgPriceLabel.text = "1박 평균 가격은 \(avgPrice) 원입니다."
        
        _ = UIFont(name:"Apple SD Gothic Neo" , size: 19)




        //위에서 만든 attributedStr에 addAttribute메소드를 통해 Attribute를 적용. kCTFontAttributeName은 value로 폰트크기와 폰트를 받을 수 있음.

        let attributedString = NSMutableAttributedString(string: avgPriceLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: (avgPriceLabel.text! as NSString).range(of:"Zedd"))

            avgPriceLabel.attributedText = attributedString

        //view part view radius
        //self.completeView.round(corners: [.bottomLeft, .bottomRight], cornerRadius: 15)
        
        //view part view border color
        self.middleView.layer.addBorder([.bottom, .top], color: UIColor.gray , width: 0.5)
        let yourBackImage = UIImage(named: "naviBtnBackB")
               self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
               self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
               /*navaigation 이름 변경*/
               self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

               /*navaigation border 삭제*/
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func seeSafari(_ sender: Any) {
        if let url = URL(string: "http://naver.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    
    @IBAction func clickComplete(_ sender: Any) {
        delegate?.dataReceived(data: String(totalP), hotelNum: hotelNum, day: Day)
        dismiss(animated: true, completion: nil)
//
       // 계산한 전체 총값을 그 전 뷰에서 받는 것
        
    }
    
    @IBAction func minusDay(_ sender: Any) {
        if Day == 1{
           //Do nothing
        }
        else{
            Day = Day - 1
            sleepDay.text = "\(Day)"
            // 자릿수 표현 삽입
            totalP = Day * avgPrice
            totalPrice.text = String((Day * avgPrice).commaRepresentation) + " ₩"
            sleepDay.sizeToFit()
            avgPriceLabel.sizeToFit()
            totalPrice.sizeToFit()
        }
    }
    @IBAction func plusDay(_ sender: Any) {
            Day = Day + 1
            sleepDay.text = "\(Day)"
            totalP = Day * avgPrice
            totalPrice.text = String((Day * avgPrice).commaRepresentation) + " ₩"
            sleepDay.sizeToFit()
            avgPriceLabel.sizeToFit()
            totalPrice.sizeToFit()
    }
    
}








extension Int { //자릿수 표현 extension
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}


//원하는 부분 뷰 radius
extension UIView{
    func round(corners: UIRectCorner, cornerRadius: Double){
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}

//원하는 부분 뷰 테두리색
extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
