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
            UISetup()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    

    func configure(with chat: Chat, chatRoom: ChatRoom) {
          messageLB.text = chat.message
          chatroomName.text = chatRoom.chatroomName
          userLB.text = chat.user.rawValue
          dateLB.text = chat.date.formattedTimeYYMMDD()
          profileImage.applyProfileImageSetup(cornerRadius: 40, imageName: chat.user.profileImage)
          profileImage.backgroundColor = .red
      }
      
    
      private func UISetup() {
          messageLB.chatLbSetup(fontSize: 16)
          userLB.chatLbSetup(fontSize: 16)
          dateLB.chatLbSetup(fontSize: 13, textColor: .gray)
          userLB.font = UIFont.boldSystemFont(ofSize: 16)
          
      }
  }
