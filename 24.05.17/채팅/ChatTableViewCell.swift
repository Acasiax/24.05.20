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
    
}
