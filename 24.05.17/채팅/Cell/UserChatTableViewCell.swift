//
//  UserChatTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 6/1/24.
//

import UIKit

class UserChatTableViewCell: UITableViewCell {

    
    @IBOutlet var userUIView: UIView!
    @IBOutlet var userMessagechatLB: UILabel!
    @IBOutlet var userMessageDateLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configure(with message: String) {
        userUIView.backgroundColor = .systemPink
        userUIView.layer.cornerRadius = 15
        userUIView.layer.masksToBounds = true
        
        userMessagechatLB.text = message
        userMessagechatLB.backgroundColor = .clear
        userMessagechatLB.numberOfLines = 0
        
        userMessageDateLB.text = "시간:"
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
