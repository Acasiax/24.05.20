//
//  ChattingViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChattingViewController: UIViewController {

    static var identifier = "ChattingViewController"
    //데이타 패스1.
    var chatRoom: ChatRoom?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let chatRoom = chatRoom {
                  
                   navigationItem.title = chatRoom.chatroomName
                   print("채팅룸 \(chatRoom.chatroomName)")
               }
    }


}
