//
//  Locations.swift
//  Week7AuthMap
//
//  Created by Field Employee on 4/30/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit
import MapKit

class Locations: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        
    }
}
