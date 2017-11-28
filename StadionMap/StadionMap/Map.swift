//
//  Map.swift
//  StadionMap
//
//  Created by Muhammad Hilmy Fauzi on 27/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import Foundation
import MapKit
class Map: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(title: String,subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
