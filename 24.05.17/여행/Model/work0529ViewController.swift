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
    
    
    let CityCollectList = CityInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
        return CityCollectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: work0529TableViewCell.indentifier, for: indexPath) as? work0529TableViewCell else { return UITableViewCell() }
        cell.SettingconfigureCell(CityCollectList[indexPath.row])
        return cell
    }
}



extension work0529ViewController: UISearchBarDelegate {
    
    
    
    
}
