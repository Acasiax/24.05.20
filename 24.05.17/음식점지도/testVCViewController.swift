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
    // var locationManager: CLLocationManager!
    //  2. viewDidLoad()에서 CLLocationManager 객체 생성하기. 4. delegate = self //5. 위치 가져오기 한번에 초기화, 효율성 높임
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationManager()
        
        // 네비게이션 아이템에 버튼 추가
        let rightBarButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(showOptions))
        navigationItem.rightBarButtonItem = rightBarButton
        
        addMapControls()
        
    }
    
    func setupLocationManager() {
        print(#function)
        
        // 델리게이트를 설정하고,
        locationManager.delegate = self
        // 거리 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 사용 허용 알림
        locationManager.requestWhenInUseAuthorization()
        // 위치 사용을 허용하면 현재 위치 정보를 가져옴
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            print("위치 서비스 허용 off")
        }     
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
        if let location = locations.first {
            print("위치 업데이트!")
            print("위도 : \(location.coordinate.latitude)")
            print("경도 : \(location.coordinate.longitude)")
            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            testmap.setRegion(region, animated: true)
            
            // 현재 위치에 마커 추가
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = "현재 위치"
            testmap.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 정보를 가져오는데 실패했습니다: \(error.localizedDescription)")
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
    
    func addMapControls() {
        // 플러스 버튼 추가
        let zoomInButton = UIButton(frame: CGRect(x: view.frame.width - 60, y: view.frame.height - 200, width: 40, height: 40))
        zoomInButton.backgroundColor = .white
        zoomInButton.layer.cornerRadius = 20
        zoomInButton.setTitle("+", for: .normal)
        zoomInButton.setTitleColor(.black, for: .normal)
        zoomInButton.addTarget(self, action: #selector(zoomIn), for: .touchUpInside)
        view.addSubview(zoomInButton)
        
        // 마이너스 버튼 추가
        let zoomOutButton = UIButton(frame: CGRect(x: view.frame.width - 60, y: view.frame.height - 150, width: 40, height: 40))
        zoomOutButton.backgroundColor = .white
        zoomOutButton.layer.cornerRadius = 20
        zoomOutButton.setTitle("-", for: .normal)
        zoomOutButton.setTitleColor(.black, for: .normal)
        zoomOutButton.addTarget(self, action: #selector(zoomOut), for: .touchUpInside)
        view.addSubview(zoomOutButton)
    }
    
    @objc func zoomIn() {
        var region = testmap.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        testmap.setRegion(region, animated: true)
    }
    
    @objc func zoomOut() {
        var region = testmap.region
        region.span.latitudeDelta *= 2.0
        region.span.longitudeDelta *= 2.0
        testmap.setRegion(region, animated: true)
    }
    
}
