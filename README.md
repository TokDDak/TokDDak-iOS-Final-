# TokDDak-iOS


Service Work Flow
======

<ol>
<li><h3> 홈 화면 입니다. </h3></li>
  <li><h3> 로그인 / 회원가입 </h3></li>
  <li><h3> 여행 제목 및 일정 선택 </h3></li>
  <li><h3> 나라 및 도시 선택 </h3></li>
  <li><h3> 카테고리 선택 </h3></li>
    <ul>
      <li> 숙박 </li>
        > 호텔 종류 선택
      <li> 식사 </li>
        > 음식 종류 선택
      <li> 주류 및 간식 </li>
        > 주류 및 간시 종류 선택
      <li> 교통 </li>
        > 교통 종류 선택
      <li> 쇼핑 </li>
        > 쇼핑 종류 선택
      <li> 액티비티 </li>
        > 액티비티 종류 선택
    </ul>
  <li><h3> 예산 선정 완료 </h3></li>
  <ul>
  <li><h3> 전체 일정 </h3></li>
  </ul>
</ol>

## Launch Screen.



## 개발 환경 및 사용한 라이브러리
### 개발환경
- Xcode 11.3
- iOS 13.3
- cocoapod
### 라이브러리
- XLpagerTapStrip
- TinyConstraints
- Moya
## 기능소개

### 메인뷰 - 풀스크롤 화면 구현 완료 - 비행기 애니메이셔 완료
- 스크롤뷰 구현
- 비행기 날아가는 애니메이션 구현
- 여행전/여행중으로 현재 상태 구별
- 컬렉션뷰로 인기여행지 도시 구현
### 메인뷰 - 여행중 뷰 구현 
- 커스텀바를 이용해 여행전뷰에서 여행중 뷰로 바로 넘어가게 커스텀 구현
<div>
<img width="515" alt="스크린샷 2020-01-03 오후 10 34 23" src="https://user-images.githubusercontent.com/37113547/71727601-246b7300-2e7e-11ea-8b7c-b50129b41c61.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 34 29" src="https://user-images.githubusercontent.com/37113547/71727612-2e8d7180-2e7e-11ea-88df-11a97d293ce8.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 35 15" src="https://user-images.githubusercontent.com/37113547/71727614-2fbe9e80-2e7e-11ea-88ba-f0010970436d.png">
</div>

### 도시선택 
- Expandable cell 구현
- Page좌우로 넘어가는 PageTapBarController 완성 (XLTapBar이용)
- 셀 선택시 해당도시로 여행 출발
<div>
<img width="515" alt="스크린샷 2020-01-03 오후 10 35 23" src="https://user-images.githubusercontent.com/37113547/71727665-60063d00-2e7e-11ea-9f24-159c0494e19f.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 35 32" src="https://user-images.githubusercontent.com/37113547/71727666-60063d00-2e7e-11ea-959f-75e2290ca231.png">
</div>


### 여행 시작
- 데이트 피커를 통한 데이터 입력
- 출발 날짜와 도작 날짜를 이용해서 , dateFormatter를 이용해서 날짜 사이의 days 기간을 구함.
<div>
<img width="515" alt="스크린샷 2020-01-03 오후 10 35 44" src="https://user-images.githubusercontent.com/37113547/71727701-79a78480-2e7e-11ea-9639-efcd545a440f.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 36 02" src="https://user-images.githubusercontent.com/37113547/71727708-7dd3a200-2e7e-11ea-854f-26c69cfd4424.png">
</div>


### 카테고리 (숙박, 음식, 쇼핑, 교통, 주류 및 간식, 액티비티) 선택 화면
- 숙박 카테고리, 팝업뷰 통신 구현
- 식사 카테고리, 통신 구현 
- 주류 및 간식 카테고리, 통신 구현
- 교통 카테고리(더미) 구현, 키패드 업다운
- 쇼핑 카테고리(더미) 구현, 키패드 업다운
- 액티비티 카테고리 , 테이블 뷰 셀, 통신 구현
<div>
<img width="515" alt="스크린샷 2020-01-03 오후 10 36 31" src="https://user-images.githubusercontent.com/37113547/71727733-90e67200-2e7e-11ea-8442-5fe24feaf5aa.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 36 40" src="https://user-images.githubusercontent.com/37113547/71727735-92179f00-2e7e-11ea-9b05-8e0d1bb858e1.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 36 46" src="https://user-images.githubusercontent.com/37113547/71727736-9348cc00-2e7e-11ea-84f7-db7771ee49f8.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 36 59" src="https://user-images.githubusercontent.com/37113547/71727737-9479f900-2e7e-11ea-997d-3c1de3402016.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 37 07" src="https://user-images.githubusercontent.com/37113547/71727740-95ab2600-2e7e-11ea-80ab-06cd2af3e8ae.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 37 17" src="https://user-images.githubusercontent.com/37113547/71727742-96dc5300-2e7e-11ea-98aa-e83d3a3f85f6.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 37 27" src="https://user-images.githubusercontent.com/37113547/71727743-980d8000-2e7e-11ea-8218-8734789b43b4.png">
<img width="515" alt="스크린샷 2020-01-03 오후 10 37 41" src="https://user-images.githubusercontent.com/37113547/71727744-98a61680-2e7e-11ea-90ba-e3defab7594e.png">
</div>

### 전체일정 예산 보기
<div>
<img width="515" alt="스크린샷 2020-01-03 오후 10 37 48" src="https://user-images.githubusercontent.com/37113547/71727770-a8bdf600-2e7e-11ea-9780-b26e482f1015.png">
</div>
<div>
<img width="482" alt="스크린샷 2020-01-03 오후 11 36 57" src="https://user-images.githubusercontent.com/55793344/71729004-056ee000-2e82-11ea-8521-2fd86a5680c0.png">
</div>
### 일정 등록 뷰
- 카테고리별 버튼 클릭시 컬렉션뷰 아이템 변경됨
- 컬렉션뷰 클릭시 데이별로 구조체 데이터 정리화되서 데이터 기능 구현
- 데이 좌우 버튼 터치시 데이별로 데이터 변경 및 정렬

### 지출 입력 뷰
- 버튼 클릭 구현
<div>
<img width="515" alt="스크린샷 2020-01-03 오후 10 34 49" src="https://user-images.githubusercontent.com/37113547/71727796-becbb680-2e7e-11ea-82d3-507481302e32.png">
</div>


### 미구현 기능
  - 예산 히스토리 기능 미구현 (작업중)
  - 여해 중 페이지에서 쓴 예산 넘기는 작업 (작업중)
  - 여행상세페이지 미구현 (작업중)

  
## 문제점과 해결 방법 report

- delegate 을 이용한 data 전달 방식 종류</h3></li>
  - segue 를 안 이용한 방식 </li
  ```
  protocol PopUpViewControllerDelegate: class {
      func popUpViewController(_ viewController: PopUpViewController, didReceiveData data: String, hotelNumber: Int, day: Int)
  }
  weak var delegate: PopUpViewControllerDelegate?
  delegate?.popUpViewController(self, didReceiveData: String(totalP), hotelNumber: subCategory, day: Day)
  
  let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryFoodViewController") as! CategoryFoodViewController
  
  ```
- reusable cell 사용시 버튼 tag 사용
```
func activityCell(_ cell: ActivityCellTableViewCell, didTapSelectButton button: UIButton) {
let tag = button.tag
guard let model = responseModel?[button.tag] else { return }
if selectedIndex.contains(tag) { // 재사용된 셀이 이미 선택이되서 active된 상태이면, 선택 해제된 셀을 재사용셀로 사용한다.
```

- xib로 뷰 구성후 

```
let headerView = UIView.instantiate(CityChooseSection.self)
headerView.foldButton.tag = section

headerView.configure(with:  twoDimensionalArray[section].country)
headerView.delegate = self
return headerView
```
    
- xib로 뷰 구성하 전 코드로 작성한 Section View

```  
let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
headerView.backgroundColor = .lightGray

let country = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
country.text = twoDimensionalArray[section].country
country.textAlignment = .center
country.backgroundColor = .cyan
country.width(100)


let button = UIButton(type: .system)
button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
button.setImage(UIImage(named: "naviBtnBackB"), for: .normal)
button.setImage(UIImage(named: "cursor"), for: .selected)
button.backgroundColor = .clear
button.tintColor = .black

button.width(50)
button.height(50)
button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)

button.tag = section

headerView.addSubview(country)
headerView.addSubview(button)
let underline = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
headerView.addSubview(underline)
underline.backgroundColor = .black
country.leadingToSuperview()
country.centerYToSuperview()
button.trailingToSuperview()
button.centerYToSuperview()
underline.height(1)
underline.trailingToSuperview()
underline.leadingToSuperview()
underline.bottomToSuperview()

return headerView 
```

```

struct DayPlanData {
    
    var day: Int = 0
    var array2: [(Int, Int)]
    var dayCost: Int = 0
   
}
데이별로 구조체 배열을 이용해 일별 데이터 관리

```swift
class TotalPlanData: CustomStringConvertible {

static let shared = TotalPlanData()
private init() {}

var startDate: String = ""
var endDate: String = ""
var travelDays: Int = 0
var cityName: String = ""
}
```
singleton patter을 이용한 전체 데이터 효율적 관리
private init(){} 을 통해 외부 참조 생성 방지


