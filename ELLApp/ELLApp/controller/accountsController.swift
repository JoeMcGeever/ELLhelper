//
//  accountsController.swift
//  ELLApp
//
//  Created by Joseph McGeever on 14/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation

class Account {
    
      
    let userData = User() // the model class
    var userInstance = User.AccountStruct(username: "", homeLanguage: "")
    
    func signUp(username: String, lang: String){
        //maybe do validation on language to find the nearerst one
        if(userData.addNewUser(username: username, language: lang)){
            print("Success in adding!")
        } else {
            print("Adding failed!")
        }
    }
    
    func login(username : String) -> Bool{
        userInstance = userData.login(username: username)
        if(userInstance.username == ""){
            return false
        }
        return true
    }
    
    func whoIsLoggedIn() {
        print(userInstance.username + " <> " + userInstance.homeLanguage)
    }
    
    func logout() {
        userInstance.username = ""
        userInstance.homeLanguage = ""
    }
    
}
