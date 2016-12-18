//
//  MainTableViewController.swift
//  HWTest3
//
//  Created by otey on 12/14/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit

protocol MainTableViewControllerInterface {
    func returnArticle(article: [ArticalModel])
}

class MainTableViewController: UITableViewController, MainTableViewControllerInterface {
    
    var articles = [ArticalModel]()
    var mainViewPresenater: MainViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        mainViewPresenater = MainViewPresenter()
        
        mainViewPresenater?.returnDataLoad(viewDelegate:self)
        mainViewPresenater?.getData(page: 1, limit: 15)
        
        self.refreshControl?.addTarget(self, action: #selector(self.handleRefresh), for: UIControlEvents.valueChanged)
        //tableView.reloadData()
        
          }
    
    func handleRefresh (){
        self.articles.removeAll()
        mainViewPresenater?.getData(page: 1, limit: 15)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainViewPresenater?.getData(page: 1, limit: 15)
        self.tableView.reloadData()
    }
    
    func returnArticle(article: [ArticalModel]) {
    
        //mainViewPresenater?.returnData(data:article)
        print(article.count)
        
        self.articles = article
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       
      
        tableView.reloadData()
          self.refreshControl?.endRefreshing()
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return articles.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! MainTableViewCell
        
        cell.configCell(article: articles[indexPath.row])
        return cell
    }
    
    }
    
    


   
   

