//
//  CountriesListViewController.swift
//  WeatherApp2
//
//  Created by mohamed gamal mohamed on 9/30/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableData : Cities?
    
    lazy var mapButton: UIBarButtonItem = {
        let tabButton = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(openMaps))
        return tabButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.setLeftBarButton(mapButton, animated: true)
        
        title = "countries"
        
        let cell = UINib(nibName: "CountriesTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CountriesTableViewCell")
        
        loadData()
    }
    
    @objc func openMaps() {
        let vc = MapViewFactory.makeMapWithNavigation()
        present(vc, animated: true, completion: nil)
    }
    
    func loadData() {
    
    if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            tableData = try decoder.decode(Cities.self, from: data)
            tableView.reloadData()
           
        } catch {
            // handle error
            print(error)
        }
    }
    }

}
extension CountriesListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell", for: indexPath) as! CountriesTableViewCell
        let data = tableData?[indexPath.row]
        cell.countryName.text = data?.country
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = tableData?[indexPath.row]
        let vc = WeatherDetailsViewController()
        vc.data = city
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension CountriesListViewController : TableViewCellDelegate {
    func didTab(_ button: UIButton, cell: UITableViewCell) {
        guard let index = tableView.indexPath(for: cell) else {return}
        let data = tableData?[index.row]
        let vc = MapViewFactory.makeMapWith((data?.coord?.lon ?? 0 , data?.coord?.lat ?? 0))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
