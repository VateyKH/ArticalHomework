//
//  ContactTableViewController.swift
//  ContactAppDemo
//
//  Created by Kokpheng on 11/20/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    // Property
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get user from class User
        users = User.getUsers()
        
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell1", for: indexPath) as! ContactTableViewCell
        
        // Configure the cell...
        let user = self.users[indexPath.row + 1]
        
        cell.configureCell(user: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
 
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let indexPath = tableView.indexPathForSelectedRow
            
            let destView = segue.destination as! DetailViewController
            destView.userDetail = self.users[(indexPath?.row)!]
        }
     }
}







