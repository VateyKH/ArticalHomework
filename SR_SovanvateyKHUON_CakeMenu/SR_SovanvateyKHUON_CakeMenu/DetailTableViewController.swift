//
//  DetailTableViewController.swift
//  SR_SovanvateyKHUON_CakeMenu
//
//  Created by otey on 11/23/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var cakeDetail: CakeInfo?
    
    @IBOutlet weak var cakeNameLabel: UILabel!
  
    @IBOutlet weak var cakeImageView: UIImageView!
    @IBOutlet weak var cakeTypeLabel: UILabel!
    @IBOutlet weak var cakeSizeLabel: UILabel!
    @IBOutlet weak var cakePriceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        cakeNameLabel.text = cakeDetail?.cakeName
        cakeImageView.image = cakeDetail?.cakeImage
        cakeTypeLabel.text = cakeDetail?.cakeType
        cakeSizeLabel.text = cakeDetail?.cakeSize
        cakePriceLabel.text = cakeDetail?.cakePrice
        
    }
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


}




