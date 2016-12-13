//
//  ViewController.swift
//  CoreDataOneToMany
//
//  Created by Kokpheng on 10/26/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create Context
        let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        
          // Create Category and Post object
        let categoryEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Category", in: context)
        
        
        let postEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Post", in: context)
        
        // Check
        if categoryEntity != nil && postEntity != nil {
            
            // Create Category from context
            let category1 : Category = Category(entity: categoryEntity!, insertInto: context)
            
            category1.name = "Vidoes"
            
            // Create  Set<Post> for storing each post
            var currentSet1 : Set<Post> = Set<Post>()
            
            // Create POST by Loop and then insert it to Set<Post>
            for i in 1...5{
                let currentPost : Post = Post(entity: postEntity!, insertInto: context)
                currentPost.name = "Vidoes Post name \(i)"
                currentPost.postDescription = "Vidoes Post description name \(i)"
                
                // Insert post to Set
                currentSet1.insert(currentPost)
            }
            
            // Set Posts to Category
            category1.posts = NSSet(set: currentSet1)
            
            let category2 : Category = Category(entity: categoryEntity!, insertInto: context)
            category2.name = "Music"
            var currentSet2 : Set<Post> = Set<Post>()
            
            for i in 1...5{
                let currentPost : Post = Post(entity: postEntity!, insertInto: context)
                currentPost.name = "Music Post name \(i)"
                currentPost.postDescription = "Music Post description name \(i)"
                currentSet2.insert(currentPost)
            }
            
            category2.posts = NSSet(set: currentSet2)
            
            let category3 : Category = Category(entity: categoryEntity!, insertInto: context)
            category3.name = "Book"
            var currentSet3 : Set<Post> = Set<Post>()
            
            for i in 1...5{
                let currentPost : Post = Post(entity: postEntity!, insertInto: context)
                currentPost.name = "Book Post name \(i)"
                currentPost.postDescription = "Book Post description name \(i)"
                currentSet3.insert(currentPost)
            }
            
            category3.posts = NSSet(set: currentSet3)
        }
        
        // Context Save
        do{
            try context.save()
        }catch {
            print("Err")
        }
        
        // Create entity
        let nsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        do{
            // Read All Category
            if let categoryResults = try context.fetch(nsFetch) as? [Category] {
                
                // Category array
                let contents = categoryResults
                
                for eachCategory in contents{
                    print(eachCategory.name!)
                    
                    // Read Array of Post from Category
                    let posts : [Post] = eachCategory.posts?.allObjects as! [Post]
                    
                    // Get Post detail
                    for j in posts {
                        print(j.name!)
                    }
                }
                
            }
        }catch{
            print("Error")
        }
    }
}

