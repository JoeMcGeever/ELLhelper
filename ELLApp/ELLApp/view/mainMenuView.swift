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
    
    
    @IBAction func unwindToMainMenu(segue: UIStoryboardSegue) {} 
    
    
    @IBAction func logout(_ sender: Any) {
        //accountInstance.whoIsLoggedIn()
        let defaults = UserDefaults.standard
        defaults.set("", forKey: defaultsKeys.username)
        self.performSegue(withIdentifier: "logOutSegue", sender: self)
        
    }
    

    
}

