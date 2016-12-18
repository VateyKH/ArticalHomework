//
//  MainViewPresenter.swift
//  HWTest3
//
//  Created by otey on 12/18/16.
//  Copyright © 2016 tey. All rights reserved.
//

import Foundation

protocol MainViewPresenterInterface {
    func returnData(data:[ArticalModel])
}

class MainViewPresenter: MainViewPresenterInterface {
    var mainViewService = ArticleService()
    var mainViewDelegate: MainTableViewControllerInterface!
    
    
    func returnDataLoad(viewDelegate: MainTableViewController) {
        mainViewDelegate = viewDelegate
        mainViewService.mainViewPresenter = self
        
    }
    
    func getData(page: Int, limit: Int) {
        mainViewService.parseJsonData(page: page, limit: limit)
    }
    
    func returnData(data: [ArticalModel]) {
        print(data.count)
        mainViewDelegate.returnArticle(article: data)
    }
    
}
