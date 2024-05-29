//
//  work0529ViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit

class work0529ViewController: UIViewController {

    @IBOutlet var UserSearchBar: UISearchBar!
    @IBOutlet var Userseg: UISegmentedControl!
    @IBOutlet var worktableview: UITableView!
    
    
    var CityCollectList = CityInfo.city
    //검색결과 거른거
    var filteredCityList = CityInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSegmentedControl()
        UserSearchBar.delegate = self
    }

  
}

extension work0529ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        worktableview.delegate = self
        worktableview.dataSource = self
        let popularCityXib = UINib(nibName: "work0529TableViewCell", bundle: nil)
        worktableview.register(popularCityXib, forCellReuseIdentifier: work0529TableViewCell.indentifier)
        //worktableview.separatorStyle = .none
        worktableview.rowHeight = 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return CityCollectList.count
        return filteredCityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: work0529TableViewCell.indentifier, for: indexPath) as? work0529TableViewCell else { return UITableViewCell() }
        cell.SettingconfigureCell(CityCollectList[indexPath.row])
        return cell
    }
}



extension work0529ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
            filterContentForSearchText(searchText)
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            filterContentForSearchText("")
        }
        
        func filterContentForSearchText(_ searchText: String) {
            worktableview.reloadData()
            
        }
    
    
}


extension work0529ViewController {
    func setupSegmentedControl() {
        
        Userseg.removeAllSegments()
        Userseg.insertSegment(withTitle: "모두", at: 0, animated: false)
        Userseg.insertSegment(withTitle: "국내", at: 1, animated: false)
        Userseg.insertSegment(withTitle: "해외", at: 2, animated: false)
        
        
        Userseg.selectedSegmentIndex = 0
        
        
        Userseg.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        print("세그먼트 인덱스 확인 🥕: \(sender.selectedSegmentIndex)")
       
        filterContentForSegmentIndex(sender.selectedSegmentIndex)
    }

    
    //이런건 스위치가 젤 편함
    func filterContentForSegmentIndex(_ index: Int) {
           switch index {
           case 1:
               CityCollectList = CityInfo.filterCities(isDomestic: true)
           case 2:
               CityCollectList = CityInfo.filterCities(isDomestic: false)
           default:
               CityCollectList = CityInfo.city
           }
           filterContentForSearchText(UserSearchBar.text ?? "")
        worktableview.reloadData()
       }
    
}
