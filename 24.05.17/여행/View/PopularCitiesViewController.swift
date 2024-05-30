//
//  PopularCitiesViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/27/24.
//

import UIKit

class PopularCitiesViewController: UIViewController {
    
    
    @IBOutlet var PopularCitiesTableView: UITableView!
    
    //Pass Data 1: 데이터를 받을 공간(프로퍼티) 생성
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
            // 스토리보드 인스턴스 생성
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if isAdCell(at: indexPath) {
                // 광고 셀을 눌렀을 때
                print("광고 셀 선택")
                guard tableView.cellForRow(at: indexPath) is ADTableViewCell else {
                    return
                }
                
                if let advc = storyboard.instantiateViewController(withIdentifier: "ADINTO") as? ADINTOViewController {
                    advc.navigationItem.title = "광고 제목"
                    
                    let navigationController = UINavigationController(rootViewController: advc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true, completion: nil)
                }
            } else {
                // 일반 셀을 눌렀을 때
                print("일반 셀 선택")
                guard let cell = tableView.cellForRow(at: indexPath) as? CitiyTableViewCell else {
                    return
                }
                
                if let newvc = storyboard.instantiateViewController(withIdentifier: "TavelInTo") as? TavelInToViewController {
                    // Pass Data 2: vc가 가지고 있는 프로퍼티에 데이터 추가/변경
                    newvc.navigationItem.title = cell.subTitleLB.text
                    newvc.cityDetail = cell.subTitleLB.text
                    
                    if let navigationController = navigationController {
                       
                        navigationController.pushViewController(newvc, animated: true)
                    } else {
                        print("내비게이션 컨트롤러 없음")
                    }
                }
            }
        
        }
    }


//🌟 과제 전 데이터 전달 개념 정리
//데이터 전달 정리
//데이터 전달은 일반적으로 두 개의 뷰 컨트롤러 간에 데이터를 주고받을 때 사용됩니다. 여기서는 `HomeViewController`에서 `DetailViewController`로 데이터를 전달하는 예를 들어 설명하겠습니다.
// 1. 데이터를 받을 공간(프로퍼티) 생성
//`DetailViewController`에서 데이터를 받을 프로퍼티를 생성합니다.
// 2. vc가 가지고 있는 프로퍼티에 데이터 추가/변경
//`HomeViewController`에서 셀을 선택할 때 `DetailViewController`의 프로퍼티에 데이터를 전달합니다.
//3. 전달 받은 값을 뷰에다가 표현
//`DetailViewController`의 `viewDidLoad` 메서드에서 전달 받은 데이터를 사용하여 뷰를 업데이트합니다. `viewDidLoad`는 뷰가 메모리에 로드된 후 호출되므로, 여기서 UI 요소에 데이터를 설정할 수 있습니다.
//🧯다시 정리
//🥕1.데이터 받을 공간 생성: DetailViewController에 데이터를 받을 프로퍼티를 생성합니다.
//🥕2. 프로퍼티에 데이터 추가/변경: `HomeViewController`에서 `DetailViewController`로 데이터 전달
//🥕3. 전달 받은 값을 뷰에 표현: `DetailViewController`의 `viewDidLoad`에서 전달 받은 데이터를 사용하여 UI를 업데이트
