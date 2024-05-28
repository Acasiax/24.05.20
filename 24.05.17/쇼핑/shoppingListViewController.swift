//
//  shoppingListViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit

class shoppingListViewController: UIViewController {

    @IBOutlet var shoppingSearchBar: UISearchBar!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var shoppingTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

extension shoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      
//    }
//    
    
}
