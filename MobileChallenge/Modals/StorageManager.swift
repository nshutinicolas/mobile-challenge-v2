//
//  StorageManager.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import Foundation
import CoreData
import UIKit

struct TodoItem {
    let title: String
    let description: String
    let photo: Data
    let priority: String
}

class StorageManager {
    static let shared = StorageManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public func createTodo(with info: TodoItem, onSuccess: @escaping (String)-> Void, onFail: @escaping (String)-> Void){
        let newTodo = TodoList(context: context)
        let todoId = String(describing:NSDate().timeIntervalSince1970).components(separatedBy: ".")[0]
        newTodo.id = "id_\(String(describing: todoId))"
        newTodo.title = info.title
        newTodo.todo_description = info.description
        newTodo.priority = info.priority
        newTodo.photo = info.photo
        newTodo.created_at = Date()
        newTodo.updated_at = Date()
        newTodo.status = "active"
        do {
            try context.save()
            onSuccess(todoId)
        } catch {
            print("failed to save todo")
            onFail("something went wrong")
        }
    }
    public func fetchAll(onSuccess: @escaping ([TodoList])-> Void, onFail: @escaping (String)-> Void){
        do {
            let todoItems = try context.fetch(TodoList.fetchRequest())
            onSuccess(todoItems)
        } catch {
            print("No todos yet error")
            onFail("Failed to get values")
        }
    }
    public func fetchSingleTodo(with id: String, onSuccess: @escaping (TodoList)-> Void, onFail: @escaping (String)-> Void) {
        do {
            let todoItems = try context.fetch(TodoList.fetchRequest())
            let todo = todoItems.first(where: {$0.id == id})
            if let todo = todo {
                onSuccess(todo)
                return
            }
            onFail("The todo aws not found")
            return
        } catch {
            print("No todos yet error")
            onFail("Failed to get values")
        }
    }
    public func updateTodo(with item: TodoList, info: TodoItem, onComplete: @escaping (Bool)-> Void){
        
    }
    public func completeTaskUpdate(of item: TodoList, onComplete: @escaping (Bool)-> Void){
        item.status = "completed"
        item.updated_at = Date()
        do {
            try context.save()
            onComplete(true)
        } catch {
            print("error updating")
            onComplete(false)
        }
    }
    public func deleteTodoItem(item: TodoList, onComplete: @escaping (Bool)-> Void){
        context.delete(item)
        do {
            try context.save()
            onComplete(true)
        } catch {
            onComplete(false)
            print("Failed to delete")
        }
    }
}


