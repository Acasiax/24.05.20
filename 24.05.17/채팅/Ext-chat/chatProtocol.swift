//
//  chatProtocol.swift
//  24.05.17
//
//  Created by 이윤지 on 6/2/24.
//

import UIKit

// CellIdentifiable 프로토콜 정의
protocol CellIdentifiable {
    static var identifier: String { get }
}

// UITableViewCell이 CellIdentifiable 프로토콜을 채택하도록 확장
extension UITableViewCell: CellIdentifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

// UIViewController가 CellIdentifiable 프로토콜을 채택하도록 확장
extension UIViewController: CellIdentifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
