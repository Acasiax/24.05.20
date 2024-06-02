//
//  ChatMessageUI.swift
//  24.05.17
//
//  Created by 이윤지 on 6/2/24.
//

import UIKit

extension UIView {
    func messageUISetup(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}

extension UILabel {
    func chatLbSetup(fontSize: CGFloat, textColor: UIColor = .black) {
        self.backgroundColor = .clear
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.numberOfLines = 0
    }
}


extension String {
    func formattedTime(from inputFormat: String = "yyyy-MM-dd HH:mm", to outputFormat: String = "HH:mm") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date)
    }
}

//채팅 리스트셀 ChatTableViewCell 이미지뷰
extension UIImageView {
    func applyProfileImageSetup(cornerRadius: CGFloat, imageName: String) {
        self.image = UIImage(named: imageName)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension String {
    func formattedTimeYYMMDD(from inputFormat: String = "yyyy-MM-dd HH:mm", to outputFormat: String = "yy.M.d") -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = inputFormat
           guard let date = dateFormatter.date(from: self) else { return nil }
           dateFormatter.dateFormat = outputFormat
           return dateFormatter.string(from: date)
       }
}
