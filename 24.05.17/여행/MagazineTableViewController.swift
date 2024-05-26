//
//  MagazineTableViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/26/24.
//

import UIKit

class MagazineTableViewController: UITableViewController {

    // 잡지 정보를 담은 배열
       var magazineInfoList: [Magazine] = MagazineInfo().magazine
       
       override func viewDidLoad() {
           //🌟뷰컨트롤러 안에 뷰디드로드가 있어서 super로 호출(면접출제)
           super.viewDidLoad()
           
           // 테이블 뷰 설정하기
          // tableView.separatorStyle = .singleLine // 구분선
           tableView.rowHeight = UITableView.automaticDimension // 자동 오토 높이 설정! 코드 기억해두기~
           tableView.estimatedRowHeight = 450 // 예상 높이 설정
           
       }
       
    // 🌟뷰가 나타날 때마다 호출되는 메소드
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           // 데이터를 다시 불러오거나 업데이트가 필요한 경우
           // reloadData() 메소드를 호출하여 테이블 뷰를 갱신하는 코드임!
           tableView.reloadData()
           print("🥕viewWillAppea 호출, reloadData 갱신🥕")
       }
       
    
    
       // 섹션 내 행의 개수 반환하는 코드
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return magazineInfoList.count
       }
       
       // 각 행에 대한 셀 설정하기
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           //🌱수업때 배운 가드문 사용하여 셀 초기화 하기
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineCell", for: indexPath) as? TravelTableCell else {
               return UITableViewCell()
           }
           let magazine = magazineInfoList[indexPath.row]
           cell.SetUpconfigure(title: magazine.title, subtitle: magazine.subtitle, date: magazine.date, imageUrl: magazine.photo_image)
           
           return cell
       }
       
       // 행 선택 시 호출되는 메소드
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print(indexPath)
           guard let url = URL(string: magazineInfoList[indexPath.row].link) else { return }
           
           // 선택된 링크 열기
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
       }
   }
