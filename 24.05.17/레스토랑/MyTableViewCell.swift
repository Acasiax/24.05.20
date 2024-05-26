//
//  MyTableViewCell.swift
//  uitableview.practice
//
//  Created by 이윤지 on 5/26/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet var customImage: UIImageView!
    @IBOutlet var customLB: UILabel!
    
    
    //이렇게 하면 호출하기가 쉬워짐
    static let identifierName = "MyTableViewCell"
    
    //이렇게 하면 호출하기가 쉬워짐
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    //셀 스타일 설정
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
