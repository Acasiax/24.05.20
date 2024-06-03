//
//  SetupTable+Ext.swift
//  24.05.17
//
//  Created by 이윤지 on 6/3/24.
//

import UIKit

protocol SectionType {
    var title: String { get }
    var cellData: [String] { get }
}

enum Sections: Int, CaseIterable, SectionType {
    case general
    case personal
    case others
    
    var title: String {
        switch self {
        case .general: return "전체 설정"
        case .personal: return "개인 설정"
        case .others: return "기타"
        }
    }
    
    var cellData: [String] {
        switch self {
        case .general: return ["공지사항", "실험실", "버전 정보"]
        case .personal: return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others: return ["고객센터/도움말"]
        }
    }
}
