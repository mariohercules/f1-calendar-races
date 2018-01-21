//
//  Calendar+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Mario Hercules Portela on 18/01/18.
//  Copyright © 2018 Mario Hercules Portela. All rights reserved.
//
//

import Foundation
import CoreData


extension Calendar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Calendar> {
        return NSFetchRequest<Calendar>(entityName: "Calendar")
    }
    
    @nonobjc public class func fetchRequest(context: NSManagedObjectContext) -> [Calendar] {
        
        var results = [Calendar]()
        
        let entityFetch = NSFetchRequest<Calendar>(entityName: "Calendar")
        
        do {
            let fetchResult = try context.fetch(entityFetch)
            results = fetchResult
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
        return results
        
    }
    
    @nonobjc public class func findObjectWithContext(fieldName: String, value: String, context: NSManagedObjectContext) -> [Calendar] {

        let fetchRequest = NSFetchRequest<Calendar>(entityName: "Calendar")
        fetchRequest.predicate = NSPredicate(format: "\(fieldName)==\(value)")

        let object = try! context.fetch(fetchRequest)
    
        return object

    }

    @NSManaged public var circuit: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var race: String?
    @NSManaged public var id: Int16
    @NSManaged public var image: String?

}
