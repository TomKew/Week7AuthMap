//
//  MapViewController.swift
//  Week7AuthMap
//
//  Created by Field Employee on 4/30/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var TheMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let London = Locations(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "IS my City")
        let Berlin = Locations(title: "Berlin", coordinate: CLLocationCoordinate2D(latitude: 52.5, longitude: 13.416667), info: "Germany Capital")
        let Kabul = Locations(title: "Kabul", coordinate: CLLocationCoordinate2D(latitude: 34.51666667    , longitude: 69.183333), info: "Afghanistan Capital")
        let Brasilia = Locations(title: "Brasilia", coordinate: CLLocationCoordinate2D(latitude: -15.78333333, longitude: -47.916667), info: "Brazil Capital")
        let Washington = Locations(title: "Washington, D.C.", coordinate: CLLocationCoordinate2D(latitude: 38.883333, longitude: -77), info: "USA Capital")
        
        
        TheMap.addAnnotation(London)
        TheMap.addAnnotation(Berlin)
        TheMap.addAnnotation(Kabul)
        TheMap.addAnnotation(Brasilia)
        TheMap.addAnnotation(Washington)
        
    }


    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Locations else {return nil}
        
        let identifier = "Location"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let location = view.annotation as? Locations else {return}
        
        let placeName = location.title
        let placeInfo = location.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

