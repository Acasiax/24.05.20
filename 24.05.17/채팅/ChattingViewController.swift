//
//  ChattingViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChattingViewController: UIViewController {

    
    @IBOutlet var chattingHomeTableView: UITableView!
    
    
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
    }

}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 0
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
     }
