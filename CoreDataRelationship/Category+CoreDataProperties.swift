//
//  Category+CoreDataProperties.swift
//  CoreDataOneToMany
//
//  Created by Kokpheng on 10/26/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Category {

    @NSManaged var name: String?
    @NSManaged var posts: NSSet?

}
