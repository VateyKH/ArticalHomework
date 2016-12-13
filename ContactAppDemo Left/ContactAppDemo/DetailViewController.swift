//
//  DetailViewController.swift
//  ContactAppDemo
//
//  Created by Kokpheng on 11/20/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    var userDetail : User?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = userDetail?.email
        // Do any additional setup after loading the view.
    }
}
