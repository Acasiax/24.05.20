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
