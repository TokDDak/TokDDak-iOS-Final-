# TokDDak-iOS


Service Work Flow
======

<ol>
  <li><h3> 홈 화면 </h3></li>
  <li><h3> 로그인 / 회원가입 </h3></li>
  <li><h3> 여행 제목 및 일정 선택 </h3></li>
  <li><h3> 나라 및 도시 선택 </h3></li>
  <li><h3> 카테고리 선택 </h3></li>
    <ul>
      <li> 숙박 </li>
        > 호테 종류 선택
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

## Launch Screen



## 개발 환경 및 사용한 라이브러리

- Xcode, 제플린, 슬랙
- XLpagerTapStrip
- TinyConstraints

## 기능소개
<div>
<img width="380" alt="스크린샷 2019-12-30 오후 6 35 13" src="https://user-images.githubusercontent.com/55793344/71582432-945fbd80-2b4d-11ea-9a1e-5097a5e6eea8.png">
<img width="380" alt="스크린샷 2019-12-30 오후 6 35 21" src="https://user-images.githubusercontent.com/55793344/71582444-9e81bc00-2b4d-11ea-997a-61acdf3f5168.png">
<img width="382" alt="스크린샷 2019-12-30 오후 6 35 46" src="https://user-images.githubusercontent.com/55793344/71582452-a6416080-2b4d-11ea-9a7a-059d589524d6.png">
</div>

### 카테고리 선택 - 팝업창, 데이터 전달 구현 완료
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 35" src="https://user-images.githubusercontent.com/37113547/71584704-4354c700-2b57-11ea-8eef-acca0d9b2183.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 39" src="https://user-images.githubusercontent.com/37113547/71584705-4354c700-2b57-11ea-8bd1-22bae2725756.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 45" src="https://user-images.githubusercontent.com/37113547/71584706-43ed5d80-2b57-11ea-807a-96e269252e07.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 50" src="https://user-images.githubusercontent.com/37113547/71584708-43ed5d80-2b57-11ea-89a2-c9f448cf0a56.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 52" src="https://user-images.githubusercontent.com/37113547/71584709-43ed5d80-2b57-11ea-9221-ef5fcf51e1b0.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 54" src="https://user-images.githubusercontent.com/37113547/71584710-43ed5d80-2b57-11ea-8ae0-a9f890c06be4.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 49 57" src="https://user-images.githubusercontent.com/37113547/71584711-4485f400-2b57-11ea-992d-11914da2ede4.png">
<img width="353" alt="스크린샷 2019-12-30 오후 10 50 03" src="https://user-images.githubusercontent.com/37113547/71584712-4485f400-2b57-11ea-8a79-662506d61a69.png">



### 메인뷰 - 풀스크롤 화면 구현 완료 - 비행기 애니메이셔 완료
- 데이터 작업중이라 예시 이미지로 구현
- 인기여행지 데이터 데이터 기다리는 중
- button을 이용해 메거진 구혀 완료 , 데이터 기다리는중
### 도시선택 - 디자인 커스텀 완료 - 대륙별 도시별 Expandeble 셀 구현 완료 도시 선택 다음 뷰로 이동
### 일정 선택뷰 - DatePicker이용하 출발 도착 Date 구현완료 , 두 날짜 사이으 Days 계산 완료 구현 완료

<div>
<img width="382" alt="스크린샷 2019-12-30 오후 6 35 59" src="https://user-images.githubusercontent.com/55793344/71582458-ab9eab00-2b4d-11ea-993b-aed98049c963.png">
<img width="481" alt="스크린샷 2019-12-30 오후 6 36 50" src="https://user-images.githubusercontent.com/55793344/71582463-afcac880-2b4d-11ea-99d6-3a0662f494aa.png">
</div>

### 미구현 기능
  - 전체일정 : Drag&Drop 기능
  - 마이페이지 : 지출 입력/출력
  - 여행상세페이지 : 스크롤 뷰
  - 총 예산 : 예산에 따른 막대기 바 배정
  
## 문제점과 해결 방법 report

- delegate 을 이용한 data 전달 방식 종류</h3></li>
  - segue 를 이용한 방식 </li>
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
