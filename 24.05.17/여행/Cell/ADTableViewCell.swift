//
//  ADTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet var ADTitleLabel: UILabel!
    @IBOutlet var ADMark: UILabel!
    
    //타입 스태틱
    static var indentifier2: String = "ADTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func configureUI() {
          
        self.contentView.backgroundColor = UIColor.systemPink      
          ADTitleLabel.textColor = .black
          ADTitleLabel.font = UIFont.systemFont(ofSize: 16)
          ADTitleLabel.numberOfLines = 0
          ADMark.text = "AD"
          ADMark.textColor = .black
          ADMark.backgroundColor = .white
          ADMark.font = UIFont.systemFont(ofSize: 12)
          ADMark.textAlignment = .center
          ADMark.layer.cornerRadius = 4
          ADMark.layer.masksToBounds = true
      }
    
    
    // 함수 매개변수에 넣어두고 따로 함수 분리 Travel 사용
    func TextTravelconfigure(with travel: Travel) {
            ADTitleLabel.text = travel.title
        }
}
