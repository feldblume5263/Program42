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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        compareMap.showsUserLocation = true
        let userLocation = locationManager.location?.coordinate
        activateButton(locations: [userLocation!], userLocation: userLocation!, destLocation: destLocation)
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
    
    func activateButton(locations: [CLLocationCoordinate2D], userLocation: CLLocationCoordinate2D, destLocation: CLLocation) -> Bool {
                
        let differenceLat = ((userLocation.latitude) - destLocation.coordinate.latitude) * ((userLocation.latitude) - destLocation.coordinate.latitude)
        print (userLocation.latitude)
        print (userLocation.longitude)
        print (differenceLat)
        let differenceLon = ((userLocation.longitude) - destLocation.coordinate.longitude) * ((userLocation.longitude) - destLocation.coordinate.longitude)
        print (differenceLon)
        if (differenceLat + differenceLon) < 0.000001 {
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
        
        setAnnotation(latitudeValue: destLocation.coordinate.latitude, longitudeValue: destLocation.coordinate.longitude, delta: 0.1, title: "미션 영역")
        
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                       longtudeValue: (pLocation?.coordinate.longitude)!,
                       delta: 0.01)
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("user locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

