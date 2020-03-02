//
//  displayUserImageView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 02/03/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class UserImageView : UIViewController {
    
    let wordBankInstance = WordBank()
    
    var accountInstance = User.AccountStruct(username: "", homeLanguage: "")
    var selectedWord = WordBank.Word(EnglishWord: "", translatedWord: "", drawnImage: UIImage(named: "questionmark")!)
    
    @IBOutlet weak var nounLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToWordBank", sender: nil)
        
    }
    @IBAction func deleteButton(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Are you sure?", message: "Image will be deleted", preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            //delete image here
            self.wordBankInstance.deleteWordImage(user: self.accountInstance.username, word: self.selectedWord.EnglishWord) //delete word function
            
            
            self.performSegue(withIdentifier: "unwindSegueToWordBank", sender: nil)
          }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
          print("User cancels")
          }))
        present(refreshAlert, animated: true, completion: nil)
        
    
    }
    
    @IBAction func labelTapped(_ sender: Any) {
        if(nounLabel.text == selectedWord.EnglishWord){
            nounLabel.text = selectedWord.TranslatedWord
        } else {
            nounLabel.text = selectedWord.EnglishWord
        }
    }
    
    override func viewDidLoad() {
        nounLabel.text = selectedWord.EnglishWord
        userImage.image = selectedWord.drawnImage
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "unwindSegueToWordBank" {
            
            let userImageView = segue.destination as! WordBankView
            userImageView.accountInstance = accountInstance
            userImageView.selectedWord = selectedWord
        }
        
    }
}
