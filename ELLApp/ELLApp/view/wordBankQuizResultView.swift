  
//
//  IntroductionViewController.swift
//  vocabLearner
//
//  Created by Joseph McGeever on 25/10/2019.
//  Copyright © 2019 Joseph McGeever. All rights reserved.
//
import UIKit

class wordBankQuizTitle: UIViewController {
    
    var accountInstance = User.AccountStruct(username: "", homeLanguage: "") //this gets populated with an account instance from the menu page
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) { //to segue away fromt his page
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
