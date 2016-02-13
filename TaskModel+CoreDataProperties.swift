//
//  TaskModel+CoreDataProperties.swift
//  TaskIt
//
//  Created by Blondyn on 11/02/16.
//  Copyright © 2016 Miroslaw Kucharzyk. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TaskModel {

    @NSManaged var name: String?
    @NSManaged var desc: String?
    @NSManaged var date: NSDate?
    @NSManaged var completed: Bool

}
