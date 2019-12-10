
//
//  CountriesTableViewCell.swift
//  WeatherApp2
//
//  Created by mohamed gamal mohamed on 9/30/19.
//  Copyright © 2019 mohamed gamal mohamed. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate : class {
    func didTab(_ button : UIButton , cell : UITableViewCell)
}

class CountriesTableViewCell: UITableViewCell {
    
    weak var delegate : TableViewCellDelegate?

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func openOnMap(_ sender: UIButton) {
        delegate?.didTab(sender , cell: self)
    }
    
    
    
}
