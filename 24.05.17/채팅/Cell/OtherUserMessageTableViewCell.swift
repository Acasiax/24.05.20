//
//  otherUserMessagelTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 6/1/24.
//

import UIKit

class OtherUserMessageTableViewCell: UITableViewCell {

    
    @IBOutlet var otherUserMessageLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    func configure(with message: String) {
        otherUserMessageLB.text = message
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
