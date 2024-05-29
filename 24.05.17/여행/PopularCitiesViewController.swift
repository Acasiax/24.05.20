//
//  PopularCitiesViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/27/24.
//

import UIKit

class PopularCitiesViewController: UIViewController {
    
    
    @IBOutlet var PopularCitiesTableView: UITableView!
    
    var cityList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopularCitiesTableView.dataSource = self
        PopularCitiesTableView.delegate = self
        
        //샐등록법 자주 봐두기
        let cityNib = UINib(nibName: CitiyTableViewCell.indentifier1, bundle: nil)
        PopularCitiesTableView.register(cityNib, forCellReuseIdentifier: CitiyTableViewCell.indentifier1)
        
        let adNib = UINib(nibName: ADTableViewCell.indentifier2, bundle: nil)
        PopularCitiesTableView.register(adNib, forCellReuseIdentifier: ADTableViewCell.indentifier2)
        
    }
    
    //인덱스 1부터 계산하기 4번째에 넣어주자
    private func isAdCell(at indexPath: IndexPath) -> Bool {
        return (indexPath.row + 1) % 4 == 0
    }
}

extension PopularCitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count + cityList.count / 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //광고 셀 생성
        if isAdCell(at: indexPath) {
            //단락평가 활용
            guard let cell = PopularCitiesTableView.dequeueReusableCell(withIdentifier: ADTableViewCell.indentifier2, for: indexPath) as? ADTableViewCell else {
                return UITableViewCell()
            }
            
            let adIndex = indexPath.row / 4
            let travel = cityList[adIndex * 3]
            cell.TextTravelconfigure(with: travel)
            
            return cell
        } else {
            guard let cell = PopularCitiesTableView.dequeueReusableCell(withIdentifier: CitiyTableViewCell.indentifier1, for: indexPath) as? CitiyTableViewCell else {
                return UITableViewCell()
            }
            
            let cityIndex = indexPath.row - indexPath.row / 4
            let travel = cityList[cityIndex]
            cell.configure(with: travel)
            
            return cell
        }
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        //여기에서 넘버오프라인즈 절대 1로 하지 않기!
    //        // 상하좌우 여백정하기!
    //        return UITableView.automaticDimension
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 행의 데이터 출력
        // 선택된 셀의 데이터 가져오기
                guard let cell = tableView.cellForRow(at: indexPath) as? CitiyTableViewCell else {
                    return
                }
        
        // 스토리보드 인스턴스 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
    
        
        // 스토리보드에서 특정 뷰 컨트롤러를 인스턴스화
        if let newvc = storyboard.instantiateViewController(withIdentifier: "TavelInTo") as? TavelInToViewController {
            // 새 뷰 컨트롤러의 내비게이션 아이템 제목을 설정
            newvc.navigationItem.title = cell.subTitleLB.text
            
            // 내비게이션 컨트롤러를 통해 새 뷰 컨트롤러로 푸시
            if let navigationController = navigationController {
                navigationController.pushViewController(newvc, animated: true)
            } else {
                print("안됩니다")
            }
        }
    }
    
    
}
