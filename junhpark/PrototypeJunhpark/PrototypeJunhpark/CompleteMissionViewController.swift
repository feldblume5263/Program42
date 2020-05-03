//
//  CompleteMissionViewController.swift
//  PrototypeJunhpark
//
//  Created by 박준홍 on 2020/04/30.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit
import MapKit

class CompleteMissionViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var compareMap: MKMapView!
        
        let locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            compareMap.showsUserLocation = true
        }
        
        func goLocation(latitudeValue: CLLocationDegrees,
                        longtudeValue: CLLocationDegrees,
                        delta span: Double) -> CLLocationCoordinate2D {
            let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
            let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
            let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
            compareMap.setRegion(pRegion, animated: true)
            return pLocation
        }
        
        func setAnnotation(latitudeValue: CLLocationDegrees,
                           longitudeValue: CLLocationDegrees,
                           delta span :Double,
                           title strTitle: String,
                           subtitle strSubTitle:String){
            let annotation = MKPointAnnotation()
            annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
            annotation.title = strTitle
            annotation.subtitle = strSubTitle
            compareMap.addAnnotation(annotation)
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let pLocation = locations.last
            _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                       longtudeValue: (pLocation?.coordinate.longitude)!,
                       delta: 0.01)
            CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
                let pm = placemarks!.first
                let country = pm!.country
                var address: String = ""
                if country != nil {
                    address = country!
                }
                if pm!.locality != nil {
                    address += " "
                    address += pm!.locality!
                }
                if pm!.thoroughfare != nil {
                    address += " "
                    address += pm!.thoroughfare!
                }
            })
            setAnnotation(latitudeValue: 37.488441, longitudeValue: 127.065112, delta: 0.1, title: "이노베이션아카데미", subtitle: "서울 강남구 개포로 416")
        }
        
    }

