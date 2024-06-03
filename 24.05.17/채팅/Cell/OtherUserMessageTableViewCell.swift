//
//  otherUserMessagelTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 6/1/24.
//

import UIKit

class OtherUserMessageTableViewCell: UITableViewCell{
    
    
    @IBOutlet var otheruserProfileImage: UIImageView!
    @IBOutlet var usernameLB: UILabel!
    @IBOutlet var otherUIView: UIView!
    @IBOutlet var otherUserMessageLB: UILabel!
    @IBOutlet var dateLB: UILabel!
   // static var identifier: String {
//            return String(describing: self)
//        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UISetup()
        
    }
    
    func configure(with message: String, date: String, user: User) {
        usernameLB.text = user.rawValue
        otherUserMessageLB.text = message
        otherUserMessageLB.numberOfLines = 0
        dateLB.text = date.formattedTime()
        otheruserProfileImage.image = UIImage(named: user.profileImage)
       
    }
    
    func UISetup() {
        self.contentView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 0.72, alpha: 1.00)
       // otheruserProfileImage.image = UIImage(systemName: "person.circle")
        otheruserProfileImage.layer.cornerRadius = otheruserProfileImage.frame.width / 2
        otheruserProfileImage.layer.masksToBounds = true
        otherUIView.messageUISetup(backgroundColor: UIColor(red: 0.74, green: 0.88, blue: 1.00, alpha: 1.00), cornerRadius: 15)
        otherUserMessageLB.chatLbSetup(fontSize: 16)
        dateLB.chatLbSetup(fontSize: 12)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
