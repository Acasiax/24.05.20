//
//  TavelInToViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit

// Pass Data 3: 전달 받은 값을 뷰에다가 표현
class TavelInToViewController: UIViewController {
    // 데이터를 받을 공간(프로퍼티) 생성
    var cityDetail: String?
    static var indentifer = "TavelInToViewController"
    
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전달 받은 값을 뷰에 표현
        if let detail = cityDetail {
            
        }
        
        
    }
}


