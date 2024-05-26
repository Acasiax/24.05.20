//
//  RestaurantViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/26/24.
//

import UIKit


class RestaurantViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!

    var restaurantList = RestaurantList().restaurantArray
    var filteredRestaurants = [Restaurant]()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        // Initialize the filteredRestaurants with the complete list
        filteredRestaurants = restaurantList
    }
}

// MARK: - UISearchBarDelegate
extension RestaurantViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredRestaurants = restaurantList
        } else {
            filteredRestaurants = restaurantList.filter { restaurant in
                return restaurant.name.contains(searchText) ||
                       restaurant.address.contains(searchText) ||
                       restaurant.category.contains(searchText)
            }
        }
        tableView.reloadData()
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
        let restaurant = filteredRestaurants[indexPath.row]

        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.address

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection if needed
    }
}
