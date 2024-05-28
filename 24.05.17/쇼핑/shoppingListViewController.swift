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
    
    var shoppingItems: [ShoppingItem] = [
           ShoppingItem(title: "그림툭 구매하기", isCompleted: true, isFavorite: true),
           ShoppingItem(title: "사이다 구매", isCompleted: false, isFavorite: false),
           ShoppingItem(title: "아이패드 케이스 최저가 알아보기", isCompleted: true, isFavorite: true),
           ShoppingItem(title: "양말", isCompleted: false, isFavorite: true)
       ]
       
    
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
