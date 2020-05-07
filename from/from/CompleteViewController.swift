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
    var destLocation = CLLocation()
    let userLocation = CLLocation()
    
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
    
    func activateButton(locations: [CLLocation], userLocation: CLLocation, destLocation: CLLocation) -> Bool {
        
        let userLocation = locations.last
        
        let differenceLat = ((userLocation?.coordinate.latitude)! - destLocation.coordinate.latitude) * ((userLocation?.coordinate.latitude)! - destLocation.coordinate.latitude)
        print (userLocation!.coordinate.latitude)
        print (userLocation!.coordinate.longitude)
        print (differenceLat)
        let differenceLon = ((userLocation?.coordinate.longitude)! - destLocation.coordinate.longitude) * ((userLocation?.coordinate.longitude)! - destLocation.coordinate.longitude)
        print (differenceLon)
        if (differenceLat + differenceLon) < 1 {
            completeButton.isEnabled = true
            completeButton.backgroundColor = UIColor(red: 0.317, green: 0.651, blue: 0.605, alpha: 1.0)
            completeButton.setTitleColor(.white, for: .normal)
            print ("버튼 활성화")
        } else {
            completeButton.isEnabled = false
            completeButton.backgroundColor = .systemGray6
            completeButton.setTitleColor(.systemGray, for: .normal)
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

