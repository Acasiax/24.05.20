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
    
    
    let mockChatList: [ChatRoom] = [
            ChatRoom(chatroomId: 1,
                     chatroomImage: [User.hue.profileImage, User.jack.profileImage, User.bran.profileImage, User.den.profileImage],
                     chatroomName: "영등포 멘토방",
                     chatList: [
                        Chat(user: .hue, date: "2024-06-12 21:30", message: "열심히 일 하시고 계시는거죠?"),
                        Chat(user: .bran, date: "2024-06-12 22:32", message: "영등포 캠퍼스 가고싶어요..."),
                        Chat(user: .jack, date: "2024-06-12 22:38", message: "화이팅!!"),
                        Chat(user: .den, date: "2024-06-12 23:42", message: "열심히 하고 있습니다!!"),
                     ]
            )
        ]
        
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
