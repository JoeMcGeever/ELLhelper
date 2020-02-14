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
    
    
}
