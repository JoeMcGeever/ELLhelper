//
//  signUp.swift
//  ELLApp
//
//  Created by Joseph McGeever on 13/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//
import UIKit
import Foundation

class login: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    let accountController = User()
    var accountInstance = User.AccountStruct(username: "", homeLanguage: "")
    
    
    @IBAction func confirmButton(_ sender: Any) {
        let username = usernameText.text ?? ""
        accountInstance = accountController.login(username:
            username)
        if(accountInstance.username == "") {
            let alert = UIAlertController(title: "No user found", message: "This user was not found", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
            }))
            present(alert, animated: true, completion: nil)
        } else {
            
            self.performSegue(withIdentifier: "loginSegue", sender: self)
                     
            
        }
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {} //for the sign up page to programatically segue back to
    
    @IBAction func newAccount(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    


}
