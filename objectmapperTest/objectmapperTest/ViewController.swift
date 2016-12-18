//
//  ViewController.swift
//  objectmapperTest
//
//  Created by otey on 12/14/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func getJson(){
        
        let url = URL(string:"http://120.136.24.174:1301/v1/api/articles?page=1&limit=15")
        var request = URLRequest(url:url!)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.httpMethod="GET"
        
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard error == nil && data != nil else{
                print("error")
                return
            }
            
            let httpStatus = response as? HTTPURLResponse
            
            if httpStatus!.statusCode == 200{
                if data?.count != 0 {
                    let responseString = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
                    
                    let item = responseString["DATA"] as! [Any]
                    let item2 = item[0] as! [String:Any]
                    let item3 = item2["TITLE"] as! String
                    
                    print(item3)
                    print(responseString)
                }
                else{
                    print("No data")
                }
            }else{
                print("Error status:", httpStatus!.statusCode)
            }
        
        
        }
        task.resume()
    }
    
    
    
    //Post Data 
 /*   func postData(){
        let url = URL(string:"http://120.136.24.174:1301/v1/api/articles?page=1&limit=15")
        var request = URLRequest(url:url!)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.httpMethod="POST"
        
        
        
        
    }*/
    
    
    
    
    
    
    
    
    

}

