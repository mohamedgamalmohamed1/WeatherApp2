//
//  WeatherDetailsViewController.swift
//  WeatherApp2
//
//  Created by mohamed gamal mohamed on 9/30/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController , WeatherDetailsViewModelDelegate{

    var data : CityModel?
    var request : WeatherRequest?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var minDegree: UILabel!
    @IBOutlet weak var maxDegree: UILabel!
    
        lazy var viewModel: WeatherDetailsViewModel = {
            let vm = WeatherDetailsViewModel()
            vm.delegate = self
            return vm
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            viewModel.loadData()
        }
        
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            viewModel.cancelDataLoading()
        }
        
       
        func animateLabels() {
            UIView.animate(withDuration: 0.6) {
                self.view.layoutIfNeeded()
                self.backgroundImage.alpha = 1.0
            }
        }
        
        func fillViewData(data: WeatherCuratedData) {
            descriptionLabel.text = data.description
            currentLabel.text = data.currentDegree
            maxDegree.text = data.maxDegree
            minDegree.text = data.minDegree
        }
        
        func startActivityIndicator() {
            activityIndicator.startAnimating()
        }
        
        func stopActivityIndicator() {
            activityIndicator.stopAnimating()
        }
    }

