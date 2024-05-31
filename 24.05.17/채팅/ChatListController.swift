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
            return mockChatList[0].chatroomName.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.indentifier, for: indexPath) as? ChatTableViewCell else {
                   return UITableViewCell()
               }
               
            let chatRoom = mockChatList[indexPath.row]
               if let lastChat = chatRoom.chatList.last {
                   cell.configure(with: lastChat, chatRoom: chatRoom)
               }
               return cell
           }
           
           
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               if let newvc = storyboard?.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController {
                   let selectedChatRoom = mockChatList[indexPath.row]
                   newvc.chatRoom = selectedChatRoom
                   
                   if let navigationController = navigationController {
                       navigationController.pushViewController(newvc, animated: true)
                   } else {
                       print("네비 없다")
                   }
               }
           }
       }

    extension ChatListController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("아아아")
        }
    }
