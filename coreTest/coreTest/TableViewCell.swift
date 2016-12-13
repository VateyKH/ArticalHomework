//
//  TableViewCell.swift
//  coreTest
//
//  Created by otey on 12/4/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func getDirectory() -> String{
        let urls = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        
        // userDomain mask is user's home directory --- place to install user's personal items
        
        let documentsDirectory = urls[0]
        return documentsDirectory
    }
    
    func configureCell(user:User){
        nameLabel.text = user.username
        emailLabel.text = user.email
        
        //get image
        let imageURL = user.toImage?.imageURL
        let filemanager = FileManager.default
        let imgPath = (self.getDirectory() as NSString).appendingPathComponent(imageURL!)
        if filemanager.fileExists(atPath: imgPath){
            self.userImageView.image = UIImage(contentsOfFile: imgPath)
        }
        else {
            print ("Cannot load image")
        }
        print("show")
    }
   }
