//
//  ADTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell, CellIdentifiable {
    
    @IBOutlet var ADTitleLabel: UILabel!
    @IBOutlet var ADMark: UILabel!
    
    //타입 스태틱
    static var identifier: String {
            return String(describing: self)
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func configureUI() {
          
        self.contentView.backgroundColor = RandomColor()
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
    
    //함수로 랜덤 기능 분리
    func RandomColor() -> UIColor {
        let colors: [UIColor] = [.systemPink, .green, .blue]
        let randomIndex = Int.random(in: 0..<colors.count)
                return colors[randomIndex]
    }
    
    
}
