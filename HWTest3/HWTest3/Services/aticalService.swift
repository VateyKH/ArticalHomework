//
//  aticalService.swift
//  HWTest3
//
//  Created by otey on 12/17/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit
class ArticleService{
    
    var articles = [ArticalModel]()
    var mainViewPresenter: MainViewPresenterInterface?
    var detailViewController: DetailViewPresenterInterface?
    
    
    func parseJsonData(page: Int, limit: Int){
        let url = URL(string:"http://120.136.24.174:1301/v1/api/articles?page=\(page)&limit=\(limit)")
        var request = URLRequest(url: url!)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.httpMethod="GET"
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, error in
            if error == nil {
                
                let httpResponse = response as! HTTPURLResponse
                
                    if  httpResponse.statusCode == 200{
                        if data?.count != 0 {
                            
                            let jsonDictionary = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String : AnyObject]
                            
                            let jsonData = jsonDictionary?["DATA"] as! [AnyObject]
                            for data in jsonData{
                                self.articles.append(ArticalModel(JSON: data as! [String : AnyObject])!)
                            }
                            
                            print("your data here:",jsonDictionary)
                            
                            self.mainViewPresenter?.returnData(data: self.articles)
                          
                        }
                    }else{
                        print("Error:", httpResponse.statusCode)
                    }
                
            }
        }
        dataTask.resume()
        
        
    }
    
    //Post JSON Data
    func postJsonData(title: String, description: String, image: String){
        
        let url = URL(string:"http://120.136.24.174:1301/v1/api/articles")
        var request = URLRequest(url: url!)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.httpMethod="POST"
        request.addValue("application/JSON", forHTTPHeaderField: "Content-type")
        request.addValue("application/JSON", forHTTPHeaderField: "Accept")
        
        let jsonDictionary = ["TITLE":title, "DESCRIPTION": description, "IMAGE":image]
        
        do{
            try request.httpBody = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
        
        } catch let error {
            print(error.localizedDescription)
        }
        
        print("Json data: ",jsonDictionary)
        
        let dataTask = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                print("got here no error")
                if  httpResponse.statusCode == 200{
                    
                    self.detailViewController?.postSuccess(message: "success")
                
                    }
            
            else{
                print (error?.localizedDescription)

            }
            
            }
            }
        dataTask.resume()
        }
        
        
    

//Upload Image
func uploadImage(image:UIImage)
{
    let url = URL(string:"http://120.136.24.174:1301/v1/api/uploadfile/single")
    var request = URLRequest(url: url!)
    
    request.httpMethod = "POST"
    let boundary = generateBoundaryString()
    
    //define the multipart request type
    request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    
    let image_data = UIImageJPEGRepresentation(image, 0.7)
    
    let body = NSMutableData()
    
    let fname = ".jpg"
    let imageType = "image/png/jpg"
    
    //define the data post parameter
    
    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
    body.append("Content-Disposition:form-data; name=\"FILE\"\r\n\r\n".data(using: String.Encoding.utf8)!)
    body.append("hi\r\n".data(using: String.Encoding.utf8)!)
    
    body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
    body.append("Content-Disposition:form-data; name=\"FILE\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
    body.append("Content-Type: \(imageType)\r\n\r\n".data(using: String.Encoding.utf8)!)
    body.append(image_data!)
    body.append("\r\n".data(using: String.Encoding.utf8)!)
    
    body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
    
    request.httpBody = body as Data
    
    let data = body as Data
    let session = URLSession.shared
    let task = session.uploadTask(with: request, from: data) {
        data, response, error in
        guard let data = data, error == nil else {
           print(error)
            return
        }
                let dataJson = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
        
        
        print("data image status",dataJson)
        
        let imageUrl = dataJson["DATA"] as! String?
        
        
        self.detailViewController?.sendImageSuccess(imageString: imageUrl!)
        
        
        print("JSON Data",dataJson["DATA"]!)
        
    }
    task.resume()
}

    func generateBoundaryString() -> String
        {
            return "Boundary-\(NSUUID().uuidString)"
        }






}



