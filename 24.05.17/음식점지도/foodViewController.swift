//
//  aaViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/26/24.
//

import UIKit
import Kingfisher
import CoreLocation
import MapKit

class foodViewController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var foodSegWay: UISegmentedControl!
    @IBOutlet var textField: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var restaurantList = RestaurantList().restaurantArray
   
    var filteredRestaurantList = [Restaurant]() {
           didSet {
               print("🔁리스트갱신 reloadData")
               tableView.reloadData()
           }
       }
    
    var locationManager: CLLocationManager!
    var userLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        textField.delegate = self
        textField.placeholder = "음식점을 입력하세요"
        filteredRestaurantList = restaurantList // 초기화시 전체 리스트를 보여줌
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifierName)
        foodSegWay.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        
        
        
        
        
    }
    

    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
           filterRestaurants()
       }
    
    //스위치 go~
    func filterRestaurants() {
        let categoryFiltered: [Restaurant]
           switch foodSegWay.selectedSegmentIndex {
           case 0:
               categoryFiltered = restaurantList
           case 1:
               categoryFiltered = restaurantList.filter { $0.category == "한식" }
           case 2:
               categoryFiltered = restaurantList.filter { $0.category == "중식" }
           case 3:
               categoryFiltered = restaurantList.filter { $0.category == "일식" }
           default:
               categoryFiltered = restaurantList
           }
        if let new = textField.text, !new.isEmpty {
                   filteredRestaurantList = categoryFiltered.filter { $0.name.contains(new) }
               } else {
                   filteredRestaurantList = categoryFiltered
               }
       }
       
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 화면🌟이 나타날 때마다 실행할 작업을 추가한 거 입니다. 데이터를 다시 로드하거나 UI 업데이트 할때 사용!
        print("viewWillAppear 호출됨🌐test뷰에서 다시 돌아올때")
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          filterRestaurants()
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

extension foodViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 행의 데이터 출력
        print(filteredRestaurantList[indexPath.row].name)
        
        // 스토리보드 인스턴스 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 스토리보드에서 특정 뷰 컨트롤러를 인스턴스화
        if let newvc = storyboard.instantiateViewController(withIdentifier: "testVC") as? testVCViewController {
            let selectedRestaurant = filteredRestaurantList[indexPath.row]
            // 새 뷰 컨트롤러의 내비게이션 아이템 제목을 설정
            newvc.navigationItem.title = selectedRestaurant.name
            newvc.restaurantLatitude = selectedRestaurant.latitude
            newvc.restaurantLongitude = selectedRestaurant.longitude
            
            newvc.locationManager = CLLocationManager() // 위치 관리자 초기화
            newvc.locationManager.delegate = newvc 
            
            // 내비게이션 컨트롤러를 통해 새 뷰 컨트롤러로 푸시
            if let navigationController = navigationController {
                navigationController.pushViewController(newvc, animated: true)
            } else {
                print("안됩니다")
            }
        }
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
