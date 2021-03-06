//
//  File.swift
//  ELLApp
//
//  Created by Joseph McGeever on 14/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct defaultsKeys {
    static let username = ""
}


class User {
    
    struct AccountStruct { //the structure of accounts, more can be added to accounts now, like progress trackers
        var username : String
        var homeLanguage : String
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getTargetLang() -> String{
        let context = appDelegate.persistentContainer.viewContext
               //create the context
        
        let defaults = UserDefaults.standard
        let user = defaults.string(forKey: defaultsKeys.username)!
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Accounts")
        fetchRequest.predicate = NSPredicate(format: "username = %@", user)
               
        let objects = try! context.fetch(fetchRequest)
        let lang = (objects[0] as AnyObject).value(forKey : "homeLanguage") as? String ?? ""
        
        
        print(lang)
        return lang
    }
    
    func addNewUser(username: String, language: String) -> Bool{
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Accounts", in: context)//set the netity that we wish to manipulate
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(username, forKey: "username")
        newUser.setValue(language, forKey: "homeLanguage")
        //sets the values in core data for the key
        do {
            try context.save()
            return true //true if success
        } catch {
            return false
        }
    }
    
    func login(username : String) -> AccountStruct{
        var name = ""
        var lang = ""
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Accounts")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", username) //filter search with this predicate
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                name = (data.value(forKey: "username") as! String)
                lang = (data.value(forKey: "homeLanguage") as! String)
                let userInstance = AccountStruct(username: name, homeLanguage: lang)
                let defaults = UserDefaults.standard
                defaults.set(name, forKey: defaultsKeys.username)
                
                
                return userInstance
          }
        } catch {
            print("Failed")
        }
        return AccountStruct(username: name, homeLanguage: lang)
    }
    
    
}
