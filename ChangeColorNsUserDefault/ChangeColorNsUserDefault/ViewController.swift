//
//  ViewController.swift
//  ChangeColorNsUserDefault
//
//  Created by HRD on 12/1/16.
//  Copyright © 2016 Minea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedColor: UISegmentedControl!
    let selectColor = UserDefaults.standard
    let myColor = "myColor"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//       getSavedColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSavedColor(){
        switch (selectColor.integer(forKey: myColor)) {
        case 0:
            self.view.backgroundColor = UIColor.red
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.yellow
        default:
            break
        }
    }

    @IBAction func SaveColor(_ sender: Any) {
        selectColor.set(selectedColor.selectedSegmentIndex, forKey: myColor)
        getSavedColor()
    }
}

