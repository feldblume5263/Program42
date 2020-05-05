//
//  AddLocationViewController.swift
//  prototype_ver_2.0
//
//  Created by user42 on 2020/05/05.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddLocationViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet var map: MKMapView!

    let locationManager = CLLocationManager()
    
    @IBOutlet var addLocationButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        addLocationButton.layer.cornerRadius = 5.0
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.showsUserLocation = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(longGesture:)))
        map.addGestureRecognizer(longPress)
    }
    
    var location: CLLocation!
    
    @objc func longPressed(longGesture: UIGestureRecognizer)
    {
        let pressPoint = longGesture.location(in: map)
        let convert = map.convert(pressPoint, toCoordinateFrom: map)
        location = CLLocation(latitude: convert.latitude, longitude: convert.longitude)
        print("\(convert.latitude) \(convert.longitude)")
        let annotation = MKPointAnnotation()
        annotation.coordinate = convert
        map.addAnnotation(annotation)
    }
}
