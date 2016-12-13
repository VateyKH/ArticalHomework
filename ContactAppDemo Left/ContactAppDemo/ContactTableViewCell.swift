//
//  ContactTableViewCell.swift
//  ContactAppDemo
//
//  Created by Kokpheng on 11/20/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // Outlet
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configureCell(user : User)  {
        // containView.layer.cornerRadius = containView.frame.height / 2
        containView.layer.cornerRadius = 5
        containView.clipsToBounds = true
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        
        nameLabel.text = "\(user.name["title"]!): \(user.name["first"]!) \(user.name["last"]!))"
        email.text = user.email
        phoneLabel.text = user.phone
        locationLabel.text = user.location.city
        
        // load image to profile imageView
        let url = URL(string: user.picture.large)
        let data = try! Data(contentsOf: url!)
        let image = UIImage(data: data)
        profileImageView.image = image
    }
}




