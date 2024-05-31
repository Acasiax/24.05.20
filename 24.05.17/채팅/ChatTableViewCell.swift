//
//  ChatTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    
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

        func configure(with chat: Chat) {
            userLB.numberOfLines = 0
            messageLB.numberOfLines = 0
            
            userLB.text = chat.user.rawValue
            messageLB.text = chat.message
            dateLB.text = chat.date
            profileImage.image = UIImage(named: chat.user.profileImage)
            profileImage.backgroundColor = .red
            profileImage.layer.cornerRadius = 40
            profileImage.clipsToBounds = true
        }
    }
