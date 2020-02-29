//
//  mainMenuView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 14/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//
import UIKit
import Foundation

class mainMenu : UIViewController {
    
    var accountInstance = User.AccountStruct(username: "", homeLanguage: "") //this gets populated with an account instance from the login page
    
    @IBAction func unwindToMainMenu(segue: UIStoryboardSegue) {} 
    
    
    @IBAction func logout(_ sender: Any) {
        //accountInstance.whoIsLoggedIn()
        self.performSegue(withIdentifier: "logOutSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sens the account instance to the main menu page
        if segue.identifier == "wordBankSegue" {
            let wordBank = segue.destination as! WordBankView
            wordBank.accountInstance = accountInstance
            
        }
        
    }
    
}

