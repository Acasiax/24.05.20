//
//  ADINTOViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/29/24.
//

import UIKit

class ADINTOViewController: UIViewController {

    static var indentifer: String = "ADINTOViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뒤로 가기 버튼 설정
                let backButton = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backButtonTapped))
                navigationItem.leftBarButtonItem = backButton
    
    }
    
    @objc func backButtonTapped() {
          dismiss(animated: true, completion: nil)
      }
}
