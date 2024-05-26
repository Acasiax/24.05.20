//
//  aaViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/26/24.
//

import UIKit
import Kingfisher

class aaViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet var textField: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var restaurantList = RestaurantList().restaurantArray
       var filteredRestaurantList = [Restaurant]()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           tableView.dataSource = self
           tableView.delegate = self
           textField.delegate = self
           filteredRestaurantList = restaurantList // 초기화시 전체 리스트를 보여줌
           tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifierName)
       }
       
       func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
           guard let query = searchBar.text, !query.isEmpty else {
               filteredRestaurantList = restaurantList
               tableView.reloadData()
               return
           }
           
           filteredRestaurantList = restaurantList.filter { $0.name.contains(query) }
           tableView.reloadData()
       }
   }

   extension aaViewController: UITableViewDataSource, UITableViewDelegate {
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // 선택된 행의 데이터 출력
           print(filteredRestaurantList[indexPath.row].name)
           
           // 스토리보드 인스턴스 생성
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
           // 스토리보드에서 특정 뷰 컨트롤러를 인스턴스화
           let newvc = storyboard.instantiateViewController(withIdentifier: "testVC")
           
           // 새 뷰 컨트롤러의 내비게이션 아이템 제목을 설정
           newvc.navigationItem.title = filteredRestaurantList[indexPath.row].name
           
           // 내비게이션 컨트롤러를 통해 새 뷰 컨트롤러로 푸시
           navigationController?.pushViewController(newvc, animated: true)
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return filteredRestaurantList.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifierName, for: indexPath) as! MyTableViewCell
           let restaurant = filteredRestaurantList[indexPath.row]
           
           // 이미지 뷰 설정
           if let url = URL(string: restaurant.image) {
               cell.customImage.kf.setImage(with: url)
           } else {
               cell.customImage.image = UIImage(systemName: "photo")
           }
           cell.customImage.contentMode = .scaleAspectFill
           cell.customImage.layer.cornerRadius = 12
           cell.customImage.clipsToBounds = true
           
           cell.customLB.text = restaurant.name

           switch indexPath.row {
           case 0: cell.customLB.textColor = .orange
           case 1 : cell.customLB.textColor = .blue
           case 2 : cell.customLB.textColor = .purple
           default: cell.customLB.textColor = .black
           }

           switch indexPath.row {
           case 0: cell.customImage.tintColor = .orange
           case 1 : cell.customImage.tintColor = .blue
           case 2 : cell.customImage.tintColor = .purple
           default: cell.customImage.tintColor = .black
           }

           return cell
       }
   }
