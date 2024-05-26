//
//  MagazineTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelTableCell: UITableViewCell {
    
    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var magazineDateLB: UILabel!
    @IBOutlet var magazineSubTitleLB: UILabel!
    @IBOutlet var magazineTitleLB: UILabel!
    
    func SetUpconfigure(title: String, subtitle: String, date: String, imageUrl: String) {
        // 제목 레이블 설정
        magazineTitleLB.numberOfLines = 0
        magazineTitleLB.text = title
        magazineTitleLB.font = UIFont.systemFont(ofSize: 20, weight: .bold)
      
        
        //서브 레이블 설정
        magazineSubTitleLB.text = subtitle
        magazineSubTitleLB.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        magazineSubTitleLB.textColor = .gray
        
        // 날짜 레이블 설정
        magazineDateLB.text = dateFormat(dateString: date)
        magazineDateLB.textColor = .lightGray
        magazineDateLB.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        // 이미지 뷰 설정
        if let url = URL(string: imageUrl) {
            magazineImageView.kf.setImage(with: url)
        }
        magazineImageView.contentMode = .scaleAspectFill
        magazineImageView.layer.cornerRadius = 12
        magazineImageView.clipsToBounds = true
    }
    
    // 날짜 형식 변환 함수
    func dateFormat(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
                
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        dateFormatter.dateFormat = "yy년 M월 d일"
        return dateFormatter.string(from: date)
    }
}
