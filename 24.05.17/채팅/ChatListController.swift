//
//  ChattingViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChatListController: UIViewController {
    
    @IBOutlet var chatSearchBar: UISearchBar!
    @IBOutlet var chattableView: UITableView!
    

    let mockChatList = mockUpchatData1.shared.mockChatList
 
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            chattableView.delegate = self
            chattableView.dataSource = self
            chattableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: ChatTableViewCell.indentifier)
        }
    }

    extension ChatListController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return mockChatList[0].chatList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.indentifier, for: indexPath) as? ChatTableViewCell else {
                return UITableViewCell()
            }
            
            let chat = mockChatList[0].chatList[indexPath.row]
            cell.configure(with: chat)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            print("\(indexPath.row.description)")
        }
        
    }

    extension ChatListController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("아아아")
        }
    }
