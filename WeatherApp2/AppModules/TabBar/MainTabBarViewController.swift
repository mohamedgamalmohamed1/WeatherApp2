//
//  MainTabBarViewController.swift
//  WeatherApp2
//
//  Created by mohamed gamal mohamed on 9/30/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    lazy var countriesList: UINavigationController = {
        let vc = CountriesListViewController(nibName: "CountriesListViewController", bundle: nil)
        vc.tabBarItem.image = #imageLiteral(resourceName: "oo\\")
        return UINavigationController(rootViewController: vc)
    }()
    
    lazy var profile: UINavigationController = {
        let vc = UIViewController()
        vc.tabBarItem.title = "profile"
        vc.tabBarItem.image = #imageLiteral(resourceName: "user")
        return UINavigationController(rootViewController: vc)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([countriesList , profile], animated: true)

    }
}
