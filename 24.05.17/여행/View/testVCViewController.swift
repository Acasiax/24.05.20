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
      
    }
    

}
