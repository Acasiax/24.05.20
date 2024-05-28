//
//  ShoppingTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var checkBox1: UIButton!
    @IBOutlet var shoppingText: UILabel!
    @IBOutlet var starButton1: UIButton!
    
    static var indentifier3: String = "ShoppingTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configure(with item: ShoppingItem) {
          shoppingText.text = item.title
          
          let checkBoxImage = item.isCompleted ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
          checkBox1.setImage(checkBoxImage, for: .normal)
          
          let starButtonImage = item.like ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
          starButton1.setImage(starButtonImage, for: .normal)
      }
    
    
}
