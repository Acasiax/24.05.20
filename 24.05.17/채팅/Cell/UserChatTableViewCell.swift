//
//  UserChatTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 6/1/24.
//

import UIKit

class UserChatTableViewCell: UITableViewCell{

    
    @IBOutlet var userUIView: UIView!
    @IBOutlet var userMessagechatLB: UILabel!
    @IBOutlet var userMessageDateLB: UILabel!
   // static var identifier: String {
   //         return String(describing: self)
    //    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UISetup()
       
    }
    
    func configure(with message: String, date: String) {
        userMessagechatLB.text = message
        userMessageDateLB.text = date.formattedTime()
        }
    
    
    func UISetup() {
        self.contentView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 0.72, alpha: 1.00)
         userUIView.messageUISetup(backgroundColor: UIColor(red: 1.00, green: 0.78, blue: 0.87, alpha: 1.00), cornerRadius: 15)
         userMessagechatLB.chatLbSetup(fontSize: 16)
         userMessageDateLB.chatLbSetup(fontSize: 12)
     }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
