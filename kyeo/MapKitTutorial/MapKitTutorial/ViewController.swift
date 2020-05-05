//
//  ViewController.swift
//  MapKitTutorial
//
//  Created by user42 on 2020/05/03.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet var map: MKMapView!

    let locationManager = CLLocationManager()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.showsUserLocation = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(longGesture:)))
        map.addGestureRecognizer(longPress)
    }
    
    @objc func longPressed(longGesture: UIGestureRecognizer)
    {
        let pressPoint = longGesture.location(in: map)
        let convert = map.convert(pressPoint, toCoordinateFrom: map)
        let location = CLLocation(latitude: convert.latitude, longitude: convert.longitude)
        print("\(convert.latitude) \(convert.longitude)")
        let annotation = MKPointAnnotation()
        annotation.coordinate = convert
        map.addAnnotation(annotation)
    }
}
