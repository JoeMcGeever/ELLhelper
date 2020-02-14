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
    
    let accountController = Account() //HERE IS THE PROBLEM
    // THE ACCOUNT NEEDS TO BE A SINGELTON
    // OR GLOBAL ACCOUNTCONTROLLER :YIKES:
    // OR PASS THE OBJECT (but every time
    //acc maybe it wont be, most pages wont need the info
    //main will, settings will --> they can pass data
    //back to main to be updated fore thew account
    
    
    @IBAction func logout(_ sender: Any) {
        accountController.whoIsLoggedIn()
        accountController.logout()
        //self.performSegue(withIdentifier: "unwindSegue", sender: self)
        
    }
    
    
}
