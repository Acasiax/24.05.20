//
//  SetUpTableViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/23/24.
//

import UIKit

class SetUpTableViewController: UITableViewController {

    // 테이블뷰 알고가자!!
    
//    // 섹션 헤더 타이틀
//    private let sectionTitles = ["전체 설정", "개인 설정", "기타"]
//    // 셀 데이터 배열
//    private let cellData = [
//        ["공지사항", "실험실", "버전 정보"],
//        ["개인/보안", "알림", "채팅", "멀티프로필"],
//        ["고객센터/도움말"]
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableView.backgroundColor = UIColor.gray
      
    }

    private func setupNavigationBar() {
        navigationItem.title = "설정"
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections(rawValue: section)?.title
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
     // 필수매서드,count로 해서 닐 방지하기
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           guard let section = Sections(rawValue: section) else { return 0 }
           return section.cellData.count
       }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    // 섹션 헤더 뷰 설정하기
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            headerView.textLabel?.textColor = UIColor.white
        }
    }

    // 셀 설정 하는 곳
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SetCell" //항상 이름 맞는지 한번 더 체크
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        if let section = Sections(rawValue: indexPath.section) {
                    cell.textLabel?.text = section.cellData[indexPath.row]
                }
        return cell
    }
}

