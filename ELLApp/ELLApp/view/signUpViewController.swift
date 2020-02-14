//
//  ViewController.swift
//  ELLApp
//
//  Created by Joseph McGeever on 10/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import UIKit

class signUp: UIViewController {

    let accountController = Account()
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var languageText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //wtf
    }
    
    @IBAction func confirm(_ sender: Any) {
        let username = usernameText.text ?? "" //if empty, default value of ""
        let language = languageText.text ?? ""
        if(username == "" || language == ""){
            display(success: false) // displays the fail message
        } else {
            accountController.signUp(username: username, lang: language)
            display(success: true) // displays the success message
            //which then segues back to screen programaticaly
        }
    }
    
    func display(success: Bool){
        
        if(success == true){
            let alert = UIAlertController(title: "Added", message: "Account has been created!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                self.performSegue(withIdentifier: "unwindSegue", sender: self)//NOT SEGUE HERE
                
                
                print("success")
              }))
            present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Missing details", message: "Please fill in all of the details", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
            print("User cancels")
            }))
            present(alert, animated: true, completion: nil)              }
    
    }
    


}

