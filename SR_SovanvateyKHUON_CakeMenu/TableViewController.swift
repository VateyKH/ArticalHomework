//
//  TableViewController.swift
//  SR_SovanvateyKHUON_CakeMenu
//
//  Created by otey on 11/23/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var cake = [CakeInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
       print("console")
        cake.append(CakeInfo(cakeName: "Chocolate Cake Mini", cakeType: "Chocolate", cakeSize: "Small", cakePrice: "$8",cakeImage: #imageLiteral(resourceName: "img1")))
        cake.append(CakeInfo(cakeName: "Cream Cake", cakeType: "Cream", cakeSize: "Big", cakePrice: "$12",cakeImage: #imageLiteral(resourceName: "img2")))
        cake.append(CakeInfo(cakeName: "Strawberry Slide Cake ", cakeType: "Strawberry", cakeSize: "Small", cakePrice: "$4",cakeImage: #imageLiteral(resourceName: "img3")))
        cake.append(CakeInfo(cakeName: "Peanut Cake ", cakeType: "Peanut", cakeSize: "Big", cakePrice: "$12",cakeImage: #imageLiteral(resourceName: "img4")))
        cake.append(CakeInfo(cakeName: "Strawberry Big Cake ", cakeType: "Strawberry", cakeSize: "Big", cakePrice: "$25",cakeImage: #imageLiteral(resourceName: "img5")))
        
              
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cake.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
            
            cell.mainImageView.image = cake[indexPath.row].cakeImage
            cell.cakeNameLabel.text = cake[indexPath.row].cakeName
            return cell
       
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data:CakeInfo = self.cake[indexPath.row]
        self.performSegue(withIdentifier: "goToDetail", sender:data)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            
            let desView = segue.destination as! DetailTableViewController
            if(sender != nil){
                desView.cakeDetail = sender as? CakeInfo
            }
        }
    }
    


}
