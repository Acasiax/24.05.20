//
//  testVCViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/30/24.
//

import UIKit
import MapKit
import CoreLocation //1. 위치 프레임워크 임포트
import SnapKit


//3. delegate설정하기.
class testVCViewController: UIViewController {
    
    @IBOutlet var testmap: MKMapView!
    
    static var indentifier: String = "testVCViewController"
    
    var restaurantLatitude: Double?
    var restaurantLongitude: Double?
    
    
    // var locationManager: CLLocationManager!
    //  2. viewDidLoad()에서 CLLocationManager 객체 생성하기. 4. delegate = self //5. 위치 가져오기 한번에 초기화, 효율성 높임
    
    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        checkDeviceLocationAuthorization()
        
        // 네비게이션 아이템에 버튼 추가
        let rightBarButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(showOptions))
        navigationItem.rightBarButtonItem = rightBarButton
        
        addMapControls()
        
    }
    
    func checkDeviceLocationAuthorization() {
        print(#function)
        
        //4. 클래스와 프로토콜 연결
        locationManager.delegate = self
        // 거리 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 사용 허용 알림
        locationManager.requestWhenInUseAuthorization()
        
        // 위치 사용을 허용하면 현재 위치 정보를 가져옴, 이걸 확인해야 뭘 하던가 함, 일단 이거 확인 하셈!🌟
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        } else {
            print("위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요.")
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
    func setSESACLocation() {
            let defaultLocation = CLLocationCoordinate2D(latitude: 37.5176577, longitude: 126.8864088)
            let region = MKCoordinateRegion(center: defaultLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            testmap.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = defaultLocation
            annotation.title = "기본 위치"
            testmap.addAnnotation(annotation)
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




//3. 위치 관련 프로토콜 선언: CLLocationManagerDelegate
extension testVCViewController: CLLocationManagerDelegate {
    
     //5. 사용자 위치를 성공적으로 가지고 온 경우
    //코드 구성에 따라 여러번 호출이 될 수도 있다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function, "iOS14+ 이상에서 사용이 됩니다. ")
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
    
    //7-1 사용자가 허용했었는데 아이폰 설정에서 나중에 허용을 거부한다면..
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 정보를 가져오는데 실패했습니다: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorizationStatus()
        print(#function, "iOS14- 미만에서 사용이 됩니다.")
    }
    //5. 사용자 위치를 성공적으로 가지고 온 경우,  //6. 사용자 위치를 가지고 오지 못했거나, /7. 사용자의 권한 상태가 변경이 될 때(iOS14) + 인스턴스가 생성디
    
    
    //권한 요청 문구 띄우기
    //항상 띄워지지는 않음. '처음' 기준은? '처음' 기준은? 띄울 수 있는 조건!
    //notDeterminde 일 때만 얼럿창을 띄워야 함!
    //iPhone 위치 서비스를 사용하고 있는 지 확인 후 -> 현재 사용자 위치 권한 상태 확인 -> notDeterminde 일 때만 얼럿창을 띄워야 함!
    func checkLocationAuthorizationStatus() {
        
        print(#function)
        
        
        var status = locationManager.authorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status =  CLLocationManager.authorizationStatus()
        }
        
        
      //  switch CLLocationManager().authorizationStatus {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("위치 접근 권한이 허용됨")
            locationManager.startUpdatingLocation()
            
        case .notDetermined:
            print("GPS 권한 설정되지 않음")
            locationManager.requestWhenInUseAuthorization()
            
        case .denied, .restricted:
            print("위치 접근 권한이 거부됨 또는 제한됨")
            setSESACLocation() //새싹으로 이동✈️
            showLocationAccessAlert()
            
            //🌟나중에 xcode 업데이트 될 때 추가 케이스들이 발생 할 수 있으니까 미리 대응해줘 -> 그래서 사용하는것 디폴트~
            // @unknown: 추후에 미래 버전에 멤버(case)가 추가될 가능성이 있는 열겨형
            // => Unfrozen Enumeration
        @unknown default:
            print(status)
           // print(CLLocationManager().authorizationStatus )
            break
        }
        
        
//        var status = locationManager.authorizationStatus
//        
//        if #available(iOS 14.0, *) {
//            status = locationManager.authorizationStatus
//        } else {
//            status =  CLLocationManager.authorizationStatus()
//        }
//            
//            switch status {
//            case .notDetermined:
//                
//                print("이 권한에서만 권한 문구를 띄울 수 있음")
//                locationManager.desiredAccuracy = kCLLocationAccuracyBest
//                
//                locationManager.requestWhenInUseAuthorization()
//                
////            case .restricted:
////                print("이 권한에서만 권한 문구를 띄울 수 있음")
//            case .denied:
//                print("ios 설정 창으로 이동하라는 얼럿을 띄워기")
//                setSESACLocation() //새싹으로 이동✈️
//                 showLocationAccessAlert()
//            case .authorizedAlways:
//                print("위치 정보 알려달라고 로직을 구성할 수 있음")
//            case .authorizedWhenInUse:
//                print("위치 정보 알려달라고 로직을 구성할 수 있음")
//            @unknown default:
//                print(status)
//            }
//            
        
        
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
