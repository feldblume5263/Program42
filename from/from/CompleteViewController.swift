//
//  CompleteViewController.swift
//  from
//
//  Created by 박준홍 on 2020/04/30.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit
import MapKit

class CompleteViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var compareMap: MKMapView!
    @IBOutlet var completeButton: UIButton!
    
    @IBAction func afterComplete(_ sender: UIButton){
        
    }
    
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
    
    func showCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, mapView: MKMapView) {
        let circle = MKCircle(center: coordinate, radius: radius)
        compareMap.addOverlay(circle)
    }
}
