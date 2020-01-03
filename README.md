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
###개발환경
- Xcode
###라이브러리
- XLpagerTapStrip
- TinyConstraints

## 기능소개

### 메인뷰 - 풀스크롤 화면 구현 완료 - 비행기 애니메이셔 완료
- 스크롤뷰 구현
- 비행기 날아가는 애니메이션 구현
- 여행전/여행중으로 현재 상태 구별

### 도시선택 
- Expandable cell 구현
- 탭 Bar 구현

### 여행 시작
- 피커를 통한 데이터 입력


### 카테고리 (숙박, 음식, 쇼핑, 교통, 주류 및 간식, 액티비티) 선택 화면
- 숙박 카테고리, 팝업뷰 통신 구현
- 식사 카테고리, 통신 구현 
- 주류 및 간식 카테고리, 통신 구현
- 교통 카테고리(더미) 구현, 키패드 업다운
- 쇼핑 카테고리(더미) 구현, 키패드 업다운
- 액티비티 카테고리 , 테이블 뷰 셀, 통신 구현


### 전체일정 예산 보기




### 지출 입력 뷰
- 버튼 하나만 클릭 구현



### 미구현 기능
  - 예산 히스토리 기능 미구현 (작업중)
  - 여해 중 페이지에서 쓴 예산 넘기는 작업 (작업중)
  - 여행상세페이지 미구현 (작업중)

  
## 문제점과 해결 방법 report

- delegate 을 이용한 data 전달 방식 종류</h3></li>
  - segue 를 이용한 방식 </li
  ```
  let headerView = UIView.instantiate(CityChooseSection.self)
  headerView.foldButton.tag = section

  headerView.configure(with:  twoDimensionalArray[section].country)
  headerView.delegate = self
  return headerView
  ```
      

- segue 를 안 이용한 방식 </li> 

  
### Expandeble셀 구현시 , 섹션 부분을 코드로 작성 했으나 커스텀에 문제를 겪어 xib로 해결

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
