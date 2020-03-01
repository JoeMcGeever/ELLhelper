//
//  selectLangView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 01/03/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class LanguagesView : UITableViewController {
    
    var selectedLanguage : String = ""
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchSupportedLanguages()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TranslationManager.shared.supportedLanguages.count //number of languages returned by fetchSupportedLanguages
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
     
        let language = TranslationManager.shared.supportedLanguages[indexPath.row]
     
        cell.textLabel?.text = language.name ?? ""
        cell.detailTextLabel?.text = language.code ?? ""
     
        return cell
    }
    
    func fetchSupportedLanguages() {
        // Show a "Please wait..." alert.
         let alert = UIAlertController(title: "Searching...", message: "Please wait while translation supported languages are being fetched...", preferredStyle: UIAlertController.Style.alert)
                   alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                   }))
                   present(alert, animated: true, completion: nil)
        
                TranslationManager.shared.fetchSupportedLanguages(completion: { (success) in
   
                    if success {
                        // Display languages in the tableview.
                        DispatchQueue.main.async { [unowned self] in
                            self.tableView.reloadData()
                        }
                    } else {
                        // Show an alert saying that something went wrong.
                       print("Error")
                    }
     
            })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //perform a segue to the title page, sending the stories title along with it
        
        
        let cell = tableView.cellForRow(at: indexPath)
        
        print(cell?.textLabel)
        print(cell?.detailTextLabel)
        selectedLanguage = cell?.detailTextLabel?.text ?? ""
        
        self.performSegue(withIdentifier: "unwindToSignUp", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //send user language code back
        //sens the account instance to the main menu page
        if segue.identifier == "unwindToSignUp" {
            let signUpView = segue.destination as! signUp
            signUpView.userLanguage = selectedLanguage //send the selected story to the title page
        }
        
    }
    
    
}
