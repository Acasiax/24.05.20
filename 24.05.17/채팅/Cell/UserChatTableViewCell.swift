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
        UISetup()
       
    }
    
    func configure(with message: String, date: String) {
        
        
        userMessagechatLB.text = message
        userMessageDateLB.text = "시간: \(date)"
        }
    
    func UISetup() {
        
        userUIView.backgroundColor = .systemPink
        userUIView.layer.cornerRadius = 15
        userUIView.layer.masksToBounds = true
        userMessagechatLB.backgroundColor = .clear
        userMessagechatLB.numberOfLines = 0
       // userMessagechatLB.textAlignment = .
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
