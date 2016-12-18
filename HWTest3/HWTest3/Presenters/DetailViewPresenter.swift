//
//  DetailViewPresenter.swift
//  HWTest3
//
//  Created by otey on 12/18/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit
protocol DetailViewPresenterInterface{
    func sendImageSuccess(imageString: String)
    func postSuccess(message:String)
}

class DetailViewPresenter{
    
    var detailViewDdelegate: DetailViewControllerInterface?
    var mainViewService = ArticleService()
   
    func dataLoad(viewController : DetailViewController){
       
        detailViewDdelegate = viewController
        mainViewService.detailViewController = self
    }
    
    
    //post Data
    func postData(title: String, description: String, image: String){
        
        mainViewService.postJsonData(title: title, description: description, image: image)
    }
    func uploadData(imageURL: UIImage){
        mainViewService.uploadImage(image: imageURL)
        
    }
   
    
}

extension DetailViewPresenter:DetailViewPresenterInterface{
    func sendImageSuccess(imageString: String) {
        detailViewDdelegate?.sendImageSuccess(imageString: imageString)
    }
    func postSuccess(message:String){
        detailViewDdelegate?.postSuccess(message: message)
    }
}
