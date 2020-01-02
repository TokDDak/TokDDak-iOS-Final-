//
//  PopUpViewController.swift
//  popUpDelegate
//
//  Created by 김준성 on 2019/12/25.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

import Alamofire

typealias PopUpModel = _MedianHotelResponseModel.Result

protocol PopUpViewControllerDelegate: class {
    func popUpViewController(_ viewController: PopUpViewController, didReceiveData data: String, hotelNumber: Int, day: Int)
}

class PopUpViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var upView: UIView!
    
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var averagePriceLabel: UILabel!
    @IBOutlet weak var sleepDayLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var firstInfoNameLabel: UILabel!
    @IBOutlet weak var secondInfoNameLabel: UILabel!
    @IBOutlet weak var thirdInfoNameLabel: UILabel!
    @IBOutlet weak var firstInfoPriceLabel: UILabel!
    @IBOutlet weak var secondInfoPriceLabel: UILabel!
    @IBOutlet weak var thirdInfoPriceLabel: UILabel!
    
    var chk : Int = 0
    
    var hotelNum = 0
    var Day = 1
    var avgPrice = 250000
    var totalP = 250000
    var sendData = "" // data 전달을 위한 sendData
    weak var delegate: PopUpViewControllerDelegate? // data 전달을 위한 delegate 선언
    var nameOfHotel : String = ""
    
    var hotelURL: URL?
    
    @IBOutlet weak var entireView: UIView!
    @IBOutlet weak var middleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelNameLabel.text = nameOfHotel
        
        //전체 뷰 radius
        self.entireView.round(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], cornerRadius: 15)
        // Do any additional setup after loading the view.
        sleepDayLabel.text = "1 박"
        averagePriceLabel.text = "1박 평균 가격은 \(avgPrice) 원입니다."
        
        _ = UIFont(name:"Apple SD Gothic Neo" , size: 19)




        //위에서 만든 attributedStr에 addAttribute메소드를 통해 Attribute를 적용. kCTFontAttributeName은 value로 폰트크기와 폰트를 받을 수 있음.

        let attributedString = NSMutableAttributedString(string: averagePriceLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: (averagePriceLabel.text! as NSString).range(of:"Zedd"))

            averagePriceLabel.attributedText = attributedString

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let cityID = 1
        APIService.shared.requestMedianHotel(cityID: cityID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(success):
                guard let data = success.data else { return }
                let superiorHotel = data.result.filter { $0.category == "최고급호텔" }.first!
                self.hotelURL = superiorHotel.url
                self.reloadView(by: superiorHotel)
            case let .failure(error):
                print("실패")
                print(error.localizedDescription)
            }
        }
    }
    
    func reloadView(by model: PopUpModel) {
        firstInfoNameLabel.text = model.info[0].name
        firstInfoPriceLabel.text = "\(model.info[0].cost) 원"
        secondInfoNameLabel.text = model.info[1].name
        secondInfoPriceLabel.text = "\(model.info[1].cost) 원"
        thirdInfoNameLabel.text = model.info[2].name
        thirdInfoPriceLabel.text = "\(model.info[2].cost) 원"
        
        
    }
    
    @IBAction func safariButtonDidTap(_ sender: UIButton) {
        guard let hotelURL = hotelURL else { return }
        UIApplication.shared.open(hotelURL, options: [:])
    }
    
    @IBAction func clickComplete(_ sender: Any) {
        delegate?.popUpViewController(self, didReceiveData: String(totalP), hotelNumber: hotelNum, day: Day)
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
            sleepDayLabel.text = "\(Day)"
            // 자릿수 표현 삽입
            totalP = Day * avgPrice
            totalPriceLabel.text = String((Day * avgPrice).commaRepresentation) + " ₩"
            sleepDayLabel.sizeToFit()
            averagePriceLabel.sizeToFit()
            totalPriceLabel.sizeToFit()
        }
    }
    @IBAction func plusDay(_ sender: Any) {
            Day = Day + 1
            sleepDayLabel.text = "\(Day)"
            totalP = Day * avgPrice
            totalPriceLabel.text = String((Day * avgPrice).commaRepresentation) + " ₩"
            sleepDayLabel.sizeToFit()
            averagePriceLabel.sizeToFit()
            totalPriceLabel.sizeToFit()
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
