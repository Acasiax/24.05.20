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
           
        let nib = UINib(nibName: CitiyTableViewCell.indentifier1, bundle: nil)
        PopularCitiesTableView.register(nib, forCellReuseIdentifier: CitiyTableViewCell.indentifier1)
           }
       }

       extension PopularCitiesViewController: UITableViewDelegate, UITableViewDataSource {
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return cityList.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               guard let cell = PopularCitiesTableView.dequeueReusableCell(withIdentifier: CitiyTableViewCell.indentifier1, for: indexPath) as? CitiyTableViewCell else {
                   return UITableViewCell()
               }
               
               let travel = cityList[indexPath.row]
               cell.configure(with: travel)
               
               return cell
           }
       }
