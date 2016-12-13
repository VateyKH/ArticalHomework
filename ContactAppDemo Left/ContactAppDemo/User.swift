//
//  User.swift
//  AlamofireDemo
//
//  Created by Kokpheng on 10/7/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import Foundation

public class User {
    var cell : String
    var dob : String
    var email : String
    var gender : String
    var ssid : Dictionary<String, String>
    var location : Location
    var name : Dictionary<String, String>
    var nationality : String
    var phone : String
    var picture : Picture
    var registered : String
    init(){
        self.cell = ""
        self.dob = ""
        self.email = ""
        self.gender = ""
        self.ssid =  Dictionary<String, String>()
        self.location = Location()
        self.name = Dictionary<String, String>()
        self.nationality = ""
        self.phone = ""
        self.picture = Picture()
        self.registered = ""
    }
    
    init(cell : String, dob : String, email : String, gender : String, ssid : Dictionary<String, String>, location : Location, name : Dictionary<String, String>, nationality : String, phone : String, picture : Picture, registered : String){
        
        self.cell = cell
        self.dob = dob
        self.email = email
        self.gender = gender
        self.ssid =  ssid
        self.location = location
        self.name = name
        self.nationality = nationality
        self.phone = phone
        self.picture = picture
        self.registered = registered
        
    }
    
    
    static func getUsers() -> [User]{
        var user = [User]()
        user.append(User(cell: "(10) 5626-2941", dob: "1954-07-26 01:07:40", email: "guadalberto.pinto@example.com", gender: "male", ssid: ["name":"","value":"<null>"] , location: Location(city: "são carlos", postcode: "87035", state: "rio de janeiro", street: "1905 rua paraná "), name: ["first":"guadalberto","last":"pinto","title":"mr"], nationality: "BR", phone: "(43) 9230-3656", picture: Picture(large: "http://randomuser.me/api/portraits/men/50.jpg", medium: "http://randomuser.me/api/portraits/med/men/50.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/men/50.jpg"), registered: "2005-03-02 12:03:48)"))
        
        user.append(User(cell: "042-394-71-86", dob: "1946-06-08 14:42:57", email: "sofia.kantola@example.com", gender: "female", ssid: ["name":"HETU","value":"1146-004V"] , location: Location(city: "kangasniemi", postcode: "98972", state: "central ostrobothnia", street: "3175 fredrikinkatu"), name: ["first":"sofia","last":"kantola","title":"miss"], nationality: "FI", phone: "08-905-175", picture: Picture(large: "http://randomuser.me/api/portraits/women/15.jpg", medium: "http://randomuser.me/api/portraits/med/women/15.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/women/15.jpg"), registered: "2003-03-24 13:15:50)"))
        
        user.append(User(cell: "06-62-94-45-06", dob: "1984-02-02 01:06:35", email: "edouard.hubert@example.com", gender: "male", ssid: ["name":"INSEE","value":"184116156397 21"] , location: Location(city: "dunkerque", postcode: "30520", state: "haute-corse", street: "2836 avenue de la république"), name: ["first":"edouard","last":"hubert","title":"mr"], nationality: "FR", phone: "04-65-91-56-06", picture: Picture(large: "http://randomuser.me/api/portraits/men/42.jpg", medium: "http://randomuser.me/api/portraits/med/men/42.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/men/42.jpg"), registered: "2015-02-10 22:52:54)"))
        
        user.append(User(cell: "(850)-525-3696", dob: "1971-01-02 02:08:38", email: "jonas.dumont@example.com", gender: "male", ssid: ["name":"AVS","value":"756.ILKL.YCSF.11"] , location: Location(city: "renens vd 1", postcode: "3556", state: "neuchâtel", street: "4569 rue d'abbeville"), name: ["first":"jonas","last":"dumont","title":"monsieur"], nationality: "CH", phone: "(277)-716-7749", picture: Picture(large: "http://randomuser.me/api/portraits/men/81.jpg", medium: "http://randomuser.me/api/portraits/med/men/81.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/men/81.jpg"), registered: "2011-11-12 11:59:04)"))
        
        user.append(User(cell: "(526)-144-9404", dob: "1984-05-29 02:53:25", email: "gallyon.munnik@example.com", gender: "female", ssid: ["name":"BSN","value":"97135883"] , location: Location(city: "maasdriel", postcode: "83386", state: "zeeland", street: "3465 wed"), name: ["first":"gallyon","last":"munnik","title":"miss"], nationality: "NL", phone: "(643)-475-4378", picture: Picture(large: "http://randomuser.me/api/portraits/women/53.jpg", medium: "http://randomuser.me/api/portraits/med/women/53.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/women/53.jpg"), registered: "2010-09-23 15:52:43)"))
        
        user.append(User(cell: "754-276-7899", dob: "1971-05-04 10:05:38", email: "clara.lévesque@example.com", gender: "female", ssid: ["name":"","value":"<null>"] , location: Location(city: "port elgin", postcode: "42071", state: "prince edward island", street: "5798 brock rd"), name: ["first":"clara","last":"lévesque","title":"ms"], nationality: "CA", phone: "610-429-2801", picture: Picture(large: "http://randomuser.me/api/portraits/women/70.jpg", medium: "http://randomuser.me/api/portraits/med/women/70.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/women/70.jpg"), registered: "2004-10-21 04:44:33)"))
        
        user.append(User(cell: "(034)-664-1361", dob: "1991-07-29 13:53:58", email: "kübra.babacan@example.com", gender: "female", ssid: ["name":"","value":"<null>"] , location: Location(city: "muş", postcode: "85792", state: "siirt", street: "6856 vatan cd"), name: ["first":"kübra","last":"babacan","title":"mrs"], nationality: "TR", phone: "(864)-271-2401", picture: Picture(large: "http://randomuser.me/api/portraits/women/49.jpg", medium: "http://randomuser.me/api/portraits/med/women/49.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/women/49.jpg"), registered: "2009-02-26 02:07:25)"))
        
        user.append(User(cell: "0451-231-799", dob: "1970-02-07 15:47:57", email: "tracy.myers@example.com", gender: "female", ssid: ["name":"TFN","value":"755088773"] , location: Location(city: "warrnambool", postcode: "767", state: "northern territory", street: "3112 poplar dr"), name: ["first":"tracy","last":"myers","title":"ms"], nationality: "AU", phone: "09-4816-1155", picture: Picture(large: "http://randomuser.me/api/portraits/women/88.jpg", medium: "http://randomuser.me/api/portraits/med/women/88.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/women/88.jpg"), registered: "2010-04-29 07:33:58)"))
        
        user.append(User(cell: "0422-159-416", dob: "1977-01-07 04:26:12", email: "same.banks@example.com", gender: "male", ssid: ["name":"TFN","value":"710932642"] , location: Location(city: "geelong", postcode: "4263", state: "new south wales", street: "9168 country club rd"), name: ["first":"same","last":"banks","title":"mr"], nationality: "AU", phone: "03-9283-0978", picture: Picture(large: "http://randomuser.me/api/portraits/men/77.jpg", medium: "http://randomuser.me/api/portraits/med/men/77.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/men/77.jpg"), registered: "2015-06-18 16:53:46)"))
        
        user.append(User(cell: "(708)-716-0097", dob: "1978-07-15 07:41:44", email: "noemie.guerin@example.com", gender: "female", ssid: ["name":"AVS","value":"756.EBJC.LLDV.19"] , location: Location(city: "lutry", postcode: "1485", state: "basel-stadt", street: "5405 rue de la charité"), name: ["first":"noemie","last":"guerin","title":"mademoiselle"], nationality: "CH", phone: "(599)-403-9312", picture: Picture(large: "http://randomuser.me/api/portraits/women/3.jpg", medium: "http://randomuser.me/api/portraits/med/women/3.jpg", thumbnail: "http://randomuser.me/api/portraits/thumb/women/3.jpg"), registered: "2004-03-01 02:05:42)"))
       
        return user
    }

}

class Location {
    var city : String
    var postcode : String
    var state : String
    var street : String
    
    init(){
        self.city = ""
        self.postcode = ""
        self.state = ""
        self.street = ""
    }
    
    init(city: String, postcode: String, state: String, street: String){
        self.city = city
        self.postcode = postcode
        self.state = state
        self.street = street
    }
}

class Picture{
    var large : String
    var medium : String
    var thumbnail : String
    
    init(){
        self.large = ""
        self.medium = ""
        self.thumbnail = ""
    }
    
    init(large: String, medium: String, thumbnail: String){
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
