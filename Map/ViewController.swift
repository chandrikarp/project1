//
//  ViewController.swift
//  Map
//
//  Created by chandrika R on 25/11/20.
//  Copyright © 2020 chandrika R. All rights reserved.
//
import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.delegate = self
            mapView.showsUserLocation = true
            
            manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
//        manager.stopUpdatingLocation()
    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            manager.stopUpdatingLocation()
//            render(location)
//        }
//    }
//
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
        }
    }
    
//    func render(_ location: CLLocation) {
//       let sourceLocation = CLLocationCoordinate2D(latitude: 13.0247, longitude:77.5948 )
////              let destinationLocation = CLLocationCoordinate2D(latitude: 13.0247, longitude: 13.0247)÷
//
////        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let lat = location.coordinate.latitude
//        print("lat \(lat)")
//
//        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
//        let region = MKCoordinateRegion(center: sourceLocation, span: span)
//        mapView.setRegion(region, animated: true)
//
//        let pin = MKPointAnnotation()
//        pin.coordinate = sourceLocation
//        mapView.addAnnotation(pin)
//    }
}

