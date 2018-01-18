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

    @NSManaged public var circuit: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var race: String?
    @NSManaged public var id: Int16
    @NSManaged public var image: String?

}
