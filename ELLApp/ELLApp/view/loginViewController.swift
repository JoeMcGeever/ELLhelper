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
    let accountController = Account()
    
    @IBAction func confirmButton(_ sender: Any) {
        let username = usernameText.text ?? ""
        if(!accountController.login(username: username)) {
            let alert = UIAlertController(title: "No user found", message: "This user was not found", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
            print("User cancels")
            }))
            present(alert, animated: true, completion: nil)
        } else {
            accountController.whoIsLoggedIn()
        }
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {} //for the sign up page to programatically segue back to
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
