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
    let userCoreData = Account()
    
    @IBAction func confirmButton(_ sender: Any) {
        //let username = usernameText.text
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
