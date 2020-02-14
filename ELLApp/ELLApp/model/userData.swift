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

class User {
    
    struct AccountStruct { //the structure of accounts, more can be added to accounts now, like progress trackers
        var username : String
        var homeLanguage : String
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func addNewUser(username: String, language: String) -> Bool{
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Accounts", in: context)//set the netity that we wish to manipulate
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(username, forKey: "username")
        newUser.setValue(language, forKey: "homeLanguage")
        //sets the values in core data fpr the key
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
          }
        } catch {
            print("Failed")
        }
        let userInstance = AccountStruct(username: name, homeLanguage: lang)
        return userInstance
    }
    
    
}
