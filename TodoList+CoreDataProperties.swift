//
//  TodoList+CoreDataProperties.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 03/02/2022.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var created_at: Date?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var todo_description: String?
    @NSManaged public var updated_at: Date?
    @NSManaged public var photo: Data?
    @NSManaged public var priority: String?

}

extension TodoList : Identifiable {

}
