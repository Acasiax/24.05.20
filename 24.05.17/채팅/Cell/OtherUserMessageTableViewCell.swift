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
        otherUIView.backgroundColor = .blue
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    

    
}
