//
//  testVCViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/30/24.
//

import UIKit
import MapKit


class testVCViewController: UIViewController {
 
    
    @IBOutlet var testmap: MKMapView!
    
    
    static var indentifier: String = "testVCViewController"
    
    var restaurantLatitude: Double?
    var restaurantLongitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let latitude = restaurantLatitude, let longitude = restaurantLongitude {
                    let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    testmap.setRegion(region, animated: true)
                    
                    // Add annotation
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location
                    annotation.title = navigationItem.title
                    testmap.addAnnotation(annotation)
                }
      
        // 네비게이션 아이템에 버튼 추가
                let rightBarButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(showOptions))
                navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    @objc func showOptions() {
            let alertController = UIAlertController(title: "유형", message: "선택하세요🥕", preferredStyle: .actionSheet)
            
        let option0 = UIAlertAction(title: "주변 식당", style: .default) { _ in
            print("📍주변 식당 당첨")
        }
        
            let option1 = UIAlertAction(title: "메가박스", style: .default) { _ in
                print("📍매가박스 당첨")
            }
            
            let option2 = UIAlertAction(title: "롯데시네마", style: .default) { _ in
                print("📍롯데시네마 당첨")
            }
            
        let option3 = UIAlertAction(title: "CGV", style: .default) { _ in
            print("📍CGV 당첨")
        }
        
        let option4 = UIAlertAction(title: "전체보기", style: .default) { _ in
            print("📍전체보기 당첨")
        }
        
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
        alertController.addAction(option0)
        alertController.addAction(option1)
        alertController.addAction(option2)
        alertController.addAction(option3)
        alertController.addAction(option4)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        }

}
