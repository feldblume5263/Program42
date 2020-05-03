//
//  InsertLocationViewController.swift
//  PrototypeJunhpark
//
//  Created by 박준홍 on 2020/04/29.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit
import MapKit

class InsertLocationViewController: UIViewController, CLLocationManagerDelegate {
    
        @IBOutlet var missionMap: MKMapView!
        
        
        let locationManager = CLLocationManager()
        var latitude:Double?
        var longitude:Double?
        var centerCoordinate: CLLocationCoordinate2D


        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            missionMap.showsUserLocation = true
            
    }
    
        func goLocation(latitudeValue: CLLocationDegrees,
                        longtudeValue: CLLocationDegrees,
                        delta span: Double) -> CLLocationCoordinate2D {
            let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
            let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
            let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
            missionMap.setRegion(pRegion, animated: true)
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
            missionMap.addAnnotation(annotation)
        }
    
        func mapCircleView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKCircleRenderer(circle: overlay as! MKCircle)
            renderer.lineWidth = 0.1
            renderer.strokeColor = UIColor.red

            return renderer
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
    }
}
