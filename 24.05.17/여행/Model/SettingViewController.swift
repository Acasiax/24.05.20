//
//  SettingViewController.swift
//  SeSAC5Week3
//
//  Created by jack on 5/28/24.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //configureView("설정 화면")
    }
    
    @IBAction func presentModal(_ sender: UIButton) {
   
        //1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        //2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        //3. 화면 띄우기
        present(vc, animated: true)
    }
    
    @IBAction func presentFullScreenModal(_ sender: UIButton) {
        
        //1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        //2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        //2-1. 화면 옵션
        //fullScreen은 dismiss를 직접 구현해주어야 한다.
        vc.modalPresentationStyle = .fullScreen
        
        //"Present 방식"에서 화면을 띄울 때 애니메이션
        //modalTransitionStyle 은 modalPresentationStyle 에 따라 동작이 안되거나 런타임 이슈가 발생할 수도 있음.
        //modalTransitionStyle 은 push 전환 방식은 무관
        vc.modalTransitionStyle = .flipHorizontal
        
        //3. 화면 띄우기
        present(vc, animated: true)

        
    }
    
    @IBAction func presentNavigationModal(_ sender: UIButton) {
        
        //1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        //2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        //2-1. 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        //3. 화면 띄우기
        present(nav, animated: true)

        
    }
    
    @IBAction func pushShow(_ sender: UIButton) {
        
        //1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        //2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        //3. 화면 띄우기: 스토리보드에서 네비게이션 컨트롤러가 임베드 되어있지 않으면, push 안됨.
        navigationController?.pushViewController(vc, animated: true)
 
        
    }
    
}
