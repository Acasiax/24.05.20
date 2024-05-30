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
    
    
    func SettingconfigureCell(_ data: City, searchText: String) {
        cityLabel.attributedText = highlightSearchText(in: data.cityName, searchText: searchText)
        citysubLB.attributedText = highlightSearchText(in: data.city_explain, searchText: searchText)
        if let url = URL(string: data.city_image) {
            cityImageView.kf.setImage(with: url)
        }
    }
    
    
    
    private func highlightSearchText(in text: String, searchText: String) -> NSAttributedString {
           let attributedText = NSMutableAttributedString(string: text)
           let lowercasedText = text.lowercased()
           let lowercasedSearchText = searchText.lowercased()
           
           if let range = lowercasedText.range(of: lowercasedSearchText) {
               let nsRange = NSRange(range, in: text)
               attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
           }
           
           return attributedText
       }
    
    
    
}

extension String {
    func ranges(of substring: String) -> [Range<String.Index>] {
        var ranges: [Range<String.Index>] = []
        var start = startIndex
        while let range = range(of: substring, range: start..<endIndex) {
            ranges.append(range)
            start = range.upperBound
        }
        return ranges
    }
}


extension work0529TableViewCell {
    func cellLayoutconfigure() {
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        cityImageView.layer.masksToBounds = true
        cityImageView.layer.cornerRadius = 20
        
        cityLabel.textColor = .white
        cityLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        cityLabel.textAlignment = .right
        
        citysubLB.textColor = .white
        citysubLB.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        citysubLB.textAlignment = .left
        
        cityBlackView.backgroundColor = .black.withAlphaComponent(0.6)
        cityBlackView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cityBlackView.layer.masksToBounds = true
        cityBlackView.layer.cornerRadius = 20
        
        
    }
}
