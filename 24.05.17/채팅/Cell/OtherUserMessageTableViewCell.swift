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
        dateLB.text = formatTime(dateString: date)
    }
    
    func UISetup() {
          otheruserProfileImage.image = UIImage(systemName: "person.circle")
          otheruserProfileImage.layer.cornerRadius = otheruserProfileImage.frame.width / 2
          otheruserProfileImage.layer.masksToBounds = true
          otherUIView.messageUISetup(backgroundColor: UIColor(red: 0.74, green: 0.88, blue: 1.00, alpha: 1.00), cornerRadius: 15)
          otherUserMessageLB.chatLbSetup(fontSize: 16)
          dateLB.chatLbSetup(fontSize: 12)
      }
    
//    func UISetup() {
//        otheruserProfileImage.image = UIImage(systemName: "person.circle")
//        otheruserProfileImage.layer.cornerRadius = otheruserProfileImage.frame.width / 2
//        otheruserProfileImage.layer.masksToBounds = true
//        otherUIView.backgroundColor = UIColor(red: 0.74, green: 0.88, blue: 1.00, alpha: 1.00)
//        
//        otherUIView.layer.cornerRadius = 15
//        otherUserMessageLB.backgroundColor = .clear
//        otherUserMessageLB.layer.masksToBounds = true
//        otherUserMessageLB.numberOfLines = 0
//        otherUserMessageLB.font = UIFont.systemFont(ofSize: 16)
//        
//        
//        dateLB.font = UIFont.systemFont(ofSize: 12)
//        dateLB.textColor = .gray
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    private func formatTime(dateString: String) -> String? {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
          guard let date = dateFormatter.date(from: dateString) else { return nil }
          
          dateFormatter.dateFormat = "HH:mm"
          return dateFormatter.string(from: date)
      }

    
}
