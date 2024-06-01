//
//  otherUserMessagelTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 6/1/24.
//

import UIKit

class OtherUserMessageTableViewCell: UITableViewCell {

    
    @IBOutlet var otheruserProfileImage: UIImageView!
    @IBOutlet var usernameLB: UILabel!
    @IBOutlet var otherUIView: UIView!
    @IBOutlet var otherUserMessageLB: UILabel!
    
    
    @IBOutlet var dateLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UISetup()
    }
    
    func configure(with message: String, date: String, user: User) {
        usernameLB.text = user.rawValue
        otherUserMessageLB.text = message
        otherUserMessageLB.numberOfLines = 0
        dateLB.text = date
    }
    
    
    func UISetup() {
        otheruserProfileImage.image = UIImage(systemName: "person.circle")
        otheruserProfileImage.layer.cornerRadius = otheruserProfileImage.frame.width / 2
        otheruserProfileImage.layer.masksToBounds = true
        otherUIView.backgroundColor = UIColor(red: 0.74, green: 0.88, blue: 1.00, alpha: 1.00)
        
        otherUIView.layer.cornerRadius = 15
        otherUserMessageLB.backgroundColor = .clear
        otherUserMessageLB.layer.masksToBounds = true
        otherUserMessageLB.numberOfLines = 0
        otherUserMessageLB.font = UIFont.systemFont(ofSize: 16)
        
        
        dateLB.font = UIFont.systemFont(ofSize: 12)
        dateLB.textColor = .gray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    

    
}
