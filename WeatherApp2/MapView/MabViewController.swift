//
//  MabViewController.swift
//  weather
//
//  Created by mohamed gamal mohamed on 7/22/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


class MabViewController: UIViewController {
    
    var camera: GMSCameraPosition?
    
    lazy var marker: GMSMarker = {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        return marker
    }()
    
    lazy var mapView: GMSMapView = {
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        return mapView
    }()

    lazy var doneBtn: UIBarButtonItem = {
        return UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(doneBtn, animated: true)
        view = mapView
    }
    


}
