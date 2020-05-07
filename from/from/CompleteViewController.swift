//
//  CompleteViewController.swift
//  from
//
//  Created by 박준홍 on 2020/04/30.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit
import MapKit

class CompleteViewController: UIViewController, CLLocationManagerDelegate
{
    
    @IBOutlet weak var compareMap: MKMapView!
    @IBOutlet var completeButton: UIButton!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        compareMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) -> CLLocationCoordinate2D
    {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        compareMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees,
                       longitudeValue: CLLocationDegrees,
                       delta span :Double,
                       title strTitle: String)
    {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        compareMap.addAnnotation(annotation)
    }
    
    func activateButton(_ userLocation: CLLocationCoordinate2D, destLocation: CLLocationCoordinate2D,shouldChangeCharactersIn range: NSRange) -> Bool {
        if (userLocation.latitude - 37) * (userLocation.latitude - 37) + (userLocation.longitude - 127) *  (userLocation.longitude - 127) > 1 {
            completeButton.isEnabled = false
        } else {
            completeButton.isEnabled = true
        }
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let pLocation = locations.last
        
        setAnnotation(latitudeValue: 37.488441, longitudeValue: 127.065112, delta: 0.1, title: "목적지")
        
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                       longtudeValue: (pLocation?.coordinate.longitude)!,
                       delta: 0.01)
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
}

