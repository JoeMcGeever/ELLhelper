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
    
    var accountInstance = Account() //this gets populated with an account instance from the login page
    
    @IBAction func unwindToMainMenu(segue: UIStoryboardSegue) {} 
    
    
    @IBAction func logout(_ sender: Any) {
        //accountInstance.whoIsLoggedIn()
        accountInstance.logout() //maybe delete the obj instead and segue back to login
        self.performSegue(withIdentifier: "logOutSegue", sender: self)
        
    }
    
    
}

