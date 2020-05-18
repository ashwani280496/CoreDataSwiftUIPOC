//
//  TodoItem.swift
//  SwiftUICoreDataPOC
//
//  Created by Djubo on 18/05/20.
//  Copyright © 2020 Djubo. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject,Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?

}

extension ToDoItem{
    static func getAllTodoItems()-> NSFetchRequest<ToDoItem>{
        let request : NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescripter =    NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescripter]
        return request
    }
}
