//
//  MapViewFactory.swift
//  weather
//
//  Created by mohamed gamal mohamed on 7/23/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

struct MapViewFactory {
    
    typealias Coordinates  = (long:Double, lat: Double)
    
    
    static func makeMapWithNavigation () -> UIViewController {
        let vc = MabViewController()
        let nav = UINavigationController(rootViewController: vc )
        vc.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        return nav
    }
    
    static func makeMapWith (_ coordinates: Coordinates) -> UIViewController {
        let vc = MabViewController()
        vc.camera = GMSCameraPosition.camera(withLatitude: coordinates.lat, longitude: coordinates.long, zoom: 6.0)
        vc.marker.position = CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.long)
        
        return vc
    }
}
