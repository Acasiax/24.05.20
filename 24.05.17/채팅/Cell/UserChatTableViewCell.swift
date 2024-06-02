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
        userMessageDateLB.text = formatTime(dateString: date)
        }
    
    
    func UISetup() {
         userUIView.messageUISetup(backgroundColor: UIColor(red: 1.00, green: 0.78, blue: 0.87, alpha: 1.00), cornerRadius: 15)
         userMessagechatLB.chatLbSetup(fontSize: 16)
         userMessageDateLB.chatLbSetup(fontSize: 12)
     }

    
    
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
