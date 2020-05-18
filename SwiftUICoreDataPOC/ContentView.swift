//
//  ContentView.swift
//  SwiftUICoreDataPOC
//
//  Created by Djubo on 18/05/20.
//  Copyright © 2020 Djubo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllTodoItems()) var todoItems: FetchedResults<ToDoItem>
    
    @State private var newTODOItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What's Next ?")){
                    HStack{
                        TextField("New Item",text: self.$newTODOItem)
                        Button(action: {
                            let todoItem = ToDoItem(context: self.managedObjectContext)
                            todoItem.title = self.newTODOItem
                            todoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newTODOItem = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")){
                    ForEach(self.todoItems){
                        todoItem in
                        ToDoItemView(title: todoItem.title!, createdAT: "\(todoItem.createdAt!)")
                    }.onDelete{indexSet in
                        let deleteItem = self.todoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do{
                            try self.managedObjectContext.save()
                        } catch{
                            print(error)
                        }
                    }
                }
                }
            .navigationBarTitle(Text("MY List"))
            .navigationBarItems(trailing: EditButton())
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
