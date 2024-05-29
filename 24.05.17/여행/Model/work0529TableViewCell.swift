//
//  work0529TableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit
import Kingfisher

class work0529TableViewCell: UITableViewCell {

    static var indentifier = "work0529TableViewCell"
    
    @IBOutlet var citysubLB: UILabel!
    @IBOutlet var cityBlackView: UIView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
        cellLayoutconfigure()
           }

           override func setSelected(_ selected: Bool, animated: Bool) {
               super.setSelected(selected, animated: animated)
           }

    func cellLayoutconfigure() {
           cityLabel.textColor = .white
           cityLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
           cityLabel.textAlignment = .right

           citysubLB.textColor = .white
           citysubLB.font = UIFont.systemFont(ofSize: 12, weight: .regular)
           citysubLB.textAlignment = .left
           
           cityBlackView.backgroundColor = .black.withAlphaComponent(0.6)
           cityBlackView.layer.maskedCorners = [.layerMaxXMaxYCorner]
           cityBlackView.layer.masksToBounds = true
           cityBlackView.layer.cornerRadius = 20
           
           cityImageView.contentMode = .scaleAspectFill
           cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
           cityImageView.layer.masksToBounds = true
           cityImageView.layer.cornerRadius = 20
       }
       
       func SettingconfigureCell(_ data: City) {
           cityLabel.text = data.cityName
           citysubLB.text = data.city_explain
           if let url = URL(string: data.city_image) {
               cityImageView.kf.setImage(with: url)
           }
       }
   }
