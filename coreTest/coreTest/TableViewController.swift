//
//  TableViewController.swift
//  coreTest
//
//  Created by otey on 12/4/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var controller: NSFetchedResultsController<User>!

    override func viewDidLoad() {
        self.attemptFetch()
        //find()
        super.viewDidLoad()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        attemptFetch()
//        tableView.reloadData()
//    }
    
//    public func context() -> Any {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        return context
//    }
    
//    public func find() -> Array<User>{
//        let listuser = Array<User>()
//        let context = self.context() as! NSManagedObjectContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
//        request.returnsObjectsAsFaults = false
//        do{
//            let results = try context.fetch(request)
//            if results.count > 0{
//                for result in results as! [NSManagedObject] {
//                    let user:User = User()
//                    user.username =  result.value(forKey:"username") as? String
//                    user.email =  result.value(forKey:"email") as? String
//                    print(user.username)
//                    
//                    
////                    user.username = result.value(forKey:"username") as! String
////                    user.password = result.value(forKey: "password") as! String
////                    listuser.append(user)
////                    print(user.username)
////                    print(user.password)
//                }
//            }
//            
//        }catch{
//            
//        }
//        
//        return listuser
//    }
//    
    
    func attemptFetch(){
        print("Hello find user")
        let fetchRequests: NSFetchRequest<User> = User.fetchRequest()
        let controller = NSFetchedResultsController(fetchRequest: fetchRequests, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

        //let controller = NSFetchedResultsController(fetchRequest: fetchRequests, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        self.controller = controller
        
        do {
            print("hello")
            try controller.performFetch()
            print("got here")
            
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
            
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionDetail = sections[section]
            return sectionDetail.numberOfObjects
        }
        return 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! TableViewCell

        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
       // cell.userImageView.image = UIImage(named: "")
        cell.nameLabel.text = "tey"
        return cell
    
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func configureCell(cell: TableViewCell, indexPath: NSIndexPath) {
        
        let user = controller.object(at: indexPath as IndexPath)
        cell.configureCell(user: user)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            if let destination = segue.destination as? DetailViewController {
                if let user = sender as? User {
                    destination.userToEdit = user
                }
            }
        }
        
        
        func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            tableView.beginUpdates()
        }
        
        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            tableView.endUpdates()
        }

        func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
            
            switch(type) {
                
            case.insert:
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
            case.delete:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                break
            case.update:
                if let indexPath = indexPath {
                    let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
                    configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
                }
                break
            case.move:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
                
            }
        }


    
        
        
        
    }


   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
