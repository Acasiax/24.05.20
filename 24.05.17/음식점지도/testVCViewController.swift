//
//  testVCViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/30/24.
//

import UIKit
import MapKit
import CoreLocation

//3. delegate설정하기.
class testVCViewController: UIViewController {
    
    @IBOutlet var testmap: MKMapView!
    
    static var indentifier: String = "testVCViewController"
    
    var restaurantLatitude: Double?
    var restaurantLongitude: Double?
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationManager()
        
        // 네비게이션 아이템에 버튼 추가
        let rightBarButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(showOptions))
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    func setupLocationManager() {
        print(#function)
        // 2. viewDidLoad()에서 CLLocationManager 객체 생성하기.
        locationManager = CLLocationManager()
        locationManager.delegate = self // 4. delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization() //5. 위치 가져오기
    }
    
    func setupMapView() {
        print(#function)
        if let latitude = restaurantLatitude, let longitude = restaurantLongitude {
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            testmap.setRegion(region, animated: true)
            
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = navigationItem.title
            testmap.addAnnotation(annotation)
        }
    }
    
    
    
    @objc func showOptions() {
        let alertController = UIAlertController(title: "유형", message: "선택하세요🥕", preferredStyle: .actionSheet)
        
        let option0 = UIAlertAction(title: "주변 식당", style: .default) { _ in
            print("📍주변 식당 당첨")
            self.checkLocationAuthorizationStatus()
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



extension testVCViewController: CLLocationManagerDelegate {
    
    // CLLocationManagerDelegate 메서드 추가
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           if let location = locations.last {
               let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
               testmap.setRegion(region, animated: true)
           }
       }
       
       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           checkLocationAuthorizationStatus()
       }
    
    
    func checkLocationAuthorizationStatus() {
        print(#function)
        switch CLLocationManager().authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
            print("위치 접근 권한이 허용됨")
                locationManager.startUpdatingLocation()
            
            case .notDetermined:
            print("GPS 권한 설정되지 않음")
            locationManager.requestWhenInUseAuthorization()
            
            case .denied, .restricted:
            print("위치 접근 권한이 거부됨 또는 제한됨")
            showLocationAccessAlert()
               
            @unknown default:
                break
            }
        }
    
    
    func showLocationAccessAlert() {
            let alert = UIAlertController(title: "위치 접근 권한 필요", message: "위치 접근 권한이 필요합니다. 설정에서 권한을 허용해주세요.", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
                if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                }
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    
}
