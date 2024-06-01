//
//  ChattingViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChattingViewController: UIViewController {

    
    @IBOutlet var chattingHomeTableView: UITableView!
    let mockChatList = mockUpchatData1.shared.mockChatList
    
    static var identifier = "ChattingViewController"
    //데이타 패스1.
    var chatRoom: ChatRoom?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let chatRoom = chatRoom {
                   navigationItem.title = chatRoom.chatroomName
                   print("채팅룸 \(chatRoom.chatroomName)")
               }
        chattingHomeTableView.delegate = self
        chattingHomeTableView.dataSource = self
        chattingHomeTableView.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellReuseIdentifier: "UserChatTableViewCell")
                chattingHomeTableView.register(UINib(nibName: "OtherUserMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "OtherUserMessageTableViewCell")
        chattingHomeTableView.rowHeight = UITableView.automaticDimension
        chattingHomeTableView.estimatedRowHeight = 100
    }

}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoom?.chatList.count ?? 0
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageData = chatRoom!.chatList[indexPath.row]
        if messageData.user == .user {
                   let cell = tableView.dequeueReusableCell(withIdentifier: "UserChatTableViewCell", for: indexPath) as! UserChatTableViewCell
            //Data Pass2. 담기
            cell.configure(with: messageData.message, date: messageData.date)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherUserMessageTableViewCell", for: indexPath) as! OtherUserMessageTableViewCell
            cell.configure(with: messageData.message, date: messageData.date, user: messageData.user)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
