//
//  ChatTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet var chatroomName: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userLB: UILabel!
    @IBOutlet var messageLB: UILabel!
    @IBOutlet var dateLB: UILabel!
    
    
    static var indentifier = "ChatTableViewCell"
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }

        func configure(with chat: Chat, chatRoom: ChatRoom) {
            
            messageLB.numberOfLines = 0
            messageLB.text = chat.message
            
            
            chatroomName.text = chatRoom.chatroomName
            
            
            userLB.numberOfLines = 0
            userLB.text = chat.user.rawValue
            
            dateLB.text = chat.date
            dateLB.font = UIFont.systemFont(ofSize: 12)
            dateLB.textColor = .gray
            
            profileImage.image = UIImage(named: chat.user.profileImage)
           // profileImage.contentMode = .scaleToFill
            profileImage.backgroundColor = .red
            profileImage.layer.cornerRadius = 40
            profileImage.clipsToBounds = true
        }
    }
