//
//  CakeInfo.swift
//  SR_SovanvateyKHUON_CakeMenu
//
//  Created by otey on 11/23/16.
//  Copyright © 2016 tey. All rights reserved.
//

import Foundation
import UIKit

class CakeInfo {
   
        var cakeName : String!
        var cakeType: String!
        var cakeImage:UIImage!
        var cakeSize: String!
        var cakePrice:String!
        init(cakeName:String, cakeType: String, cakeSize:String, cakePrice:String, cakeImage:UIImage){
        self.cakeName = cakeName
        self.cakeType = cakeType
        self.cakeSize = cakeSize
        self.cakePrice = cakePrice
        self.cakeImage = cakeImage
            
    }

    
}
