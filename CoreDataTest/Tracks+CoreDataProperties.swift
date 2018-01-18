//
//  Tracks+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Mario Hercules Portela on 17/01/18.
//  Copyright © 2018 Mario Hercules Portela. All rights reserved.
//
//

import Foundation
import CoreData


extension Tracks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tracks> {
        return NSFetchRequest<Tracks>(entityName: "Tracks")
    }

    @NSManaged public var name: String?

}
