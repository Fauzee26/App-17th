//
//  MapViewController.swift
//  StadionMap
//
//  Created by Muhammad Hilmy Fauzi on 27/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let Rungrado = Map(title: "Rungrado May Day Stadium",subtitle: "Pyongyang", coordinate: CLLocationCoordinate2D(latitude: 39.049548, longitude: 125.775324))
        let Camp = Map(title: "Camp Nou",subtitle: "Barcelona", coordinate: CLLocationCoordinate2D(latitude: 41.380896, longitude: 2.12282))
        let FNB = Map(title: "FNB Stadium",subtitle: "Johannesburg", coordinate: CLLocationCoordinate2D(latitude: -26.234757, longitude: 27.982655))
        let Rose = Map(title: "Rose Bowl Stadium",subtitle: "Pasadena", coordinate: CLLocationCoordinate2D(latitude: 34.161328, longitude: -118.167646))
        let Wembley = Map(title: "Wembley Stadium",subtitle: "London", coordinate: CLLocationCoordinate2D(latitude: 51.556021, longitude: -0.279519))
        let Bukit = Map(title: "Bukit Jalil National Stadium", subtitle: "Kuala Lumpur",coordinate: CLLocationCoordinate2D(latitude: 3.054633, longitude: 101.69134))
        let Gelora = Map(title: "Gelora Bung Karno Main Stadium", subtitle: "Jakarta", coordinate: CLLocationCoordinate2D(latitude: -6.218597, longitude: 106.801767))
        let Estadio = Map(title: "Estadio Azteca",subtitle: "Mexico City", coordinate: CLLocationCoordinate2D(latitude: 19.302861, longitude: -99.150528))
        let Borg = Map(title: "Borg El Arab Stadium",subtitle: "Alexandria", coordinate: CLLocationCoordinate2D(latitude: 30.999578, longitude: 29.729388))
        let Salt = Map(title: "Salt Lake Stadium (Yuva Bharati Krirangan)",subtitle: "Kolkata", coordinate: CLLocationCoordinate2D(latitude: 22.569054, longitude: 88.409044))
        
        mapView.addAnnotation(Rungrado)
        mapView.addAnnotation(Camp)
        mapView.addAnnotation(FNB)
        mapView.addAnnotation(Rose)
        mapView.addAnnotation(Wembley)
        mapView.addAnnotation(Bukit)
        mapView.addAnnotation(Estadio)
        mapView.addAnnotation(Gelora)
        mapView.addAnnotation(Borg)
        mapView.addAnnotation(Salt)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
