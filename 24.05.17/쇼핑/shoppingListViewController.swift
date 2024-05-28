//
//  shoppingListViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit

class shoppingListViewController: UIViewController {

   // @IBOutlet var shoppingSearchBar: UISearchBar!
    //@IBOutlet var addButton: UIButton!
    @IBOutlet var shoppingTableView: UITableView!
    
    
    
    lazy var shoppingItems: [ShoppingItem] = [
        ShoppingItem(title: "그립툭 구매하기", isCompleted: true, like: true),
        ShoppingItem(title: "사이다 구매", isCompleted: false, like: false),
        ShoppingItem(title: "아이패드 케이스 최저가 알아보기", isCompleted: true, like: true),
        ShoppingItem(title: "양말", isCompleted: false, like: true)
        ]
       
        override func viewDidLoad() {
            super.viewDidLoad()
            shoppingTableView.dataSource = self
            shoppingTableView.delegate = self
            let nib = UINib(nibName: ShoppingTableViewCell.indentifier3, bundle: nil)
            shoppingTableView.register(nib, forCellReuseIdentifier: ShoppingTableViewCell.indentifier3)
            shoppingTableView.reloadData()
        }
    }

    extension shoppingListViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shoppingItems.count
        }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = shoppingTableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.indentifier3, for: indexPath) as? ShoppingTableViewCell else {
                return UITableViewCell()
            }
           
            let item = shoppingItems[indexPath.row]
            cell.configure(with: item)
            
            cell.checkBox1.tag = indexPath.row
            cell.checkBox1.addTarget(self, action: #selector(toggleCompletion(_:)), for: .touchUpInside)
           
            // 즐겨찾기 버튼임
            cell.starButton1.tag = indexPath.row
            cell.starButton1.addTarget(self, action: #selector(toggleLikeStar(_:)), for: .touchUpInside)
           
            return cell
        }
       
        @objc func toggleCompletion(_ sender: UIButton) {
            let index = sender.tag
            shoppingItems[index].isCompleted.toggle()
            shoppingTableView.reloadData()
        }
       
        @objc func toggleLikeStar(_ sender: UIButton) {
            let index = sender.tag
            shoppingItems[index].like.toggle()
            shoppingTableView.reloadData()
        }
    }
