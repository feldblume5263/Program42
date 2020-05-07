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
    let destLocation = CLLocation(latitude: 37.488441, longitude: 127.065112)
    let userLocation = MKUserLocation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        compareMap.showsUserLocation = true
        activateButton(locations: [userLocation], userLocation: userLocation, destLocation: destLocation)
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
    
    func activateButton(locations: [MKUserLocation], userLocation: MKUserLocation, destLocation: CLLocation) -> Bool {
        
        let userLocation = locations.last
        
        let differenceLat = ((userLocation?.coordinate.latitude)! - 37) * ((userLocation?.coordinate.latitude)! - 37)
        print (userLocation?.coordinate.latitude ?? 1)
        print (userLocation?.coordinate.longitude ?? 1)
        print (differenceLat)
        let differenceLon = ((userLocation?.coordinate.longitude)! - 127) * ((userLocation?.coordinate.longitude)! - 127)
        print (differenceLon)
        if (differenceLat + differenceLon) < 1 {
            completeButton.isEnabled = true
            print ("버튼 활성화")
        } else {
            completeButton.isEnabled = false
            print ("버튼 비활성화")
        }
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let pLocation = locations.last
        
        setAnnotation(latitudeValue: destLocation.coordinate.latitude, longitudeValue: destLocation.coordinate.longitude, delta: 0.1, title: "목적지")
        
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                       longtudeValue: (pLocation?.coordinate.longitude)!,
                       delta: 0.01)
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
}

