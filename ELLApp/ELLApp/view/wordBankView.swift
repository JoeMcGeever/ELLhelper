//
//  wordBankView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 27/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class WordBankView : UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    let words = WordBank()
    var selectedWord = WordBank.Word(EnglishWord: "")
    
     var accountInstance = User.AccountStruct(username: "", homeLanguage: "") //this gets populated with an account instance from the menu page
    
    var arrayOfWords : [WordBank.Word] = []
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return arrayOfWords.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "wordInstance", for: indexPath)
           let word = arrayOfWords[indexPath.row]
           
        cell.textLabel?.text = word.EnglishWord
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //perform a segue to the title page, sending the stories title along with it
        selectedWord = arrayOfWords[indexPath.row]
        
    
        
        if(selectedWord.drawnImage != UIImage(named: "questionmark")){
            //segue to show the image (send the word with the segue so the translation can be seen if still unable to remember
            
            
            
        } else {
            //show the translation of what it is
            //segue to the draw part, sending the word so the noun can be displayed at the top
            //and then can also save the image for taht noun
            performSegue(withIdentifier: "segueToDrawNoun", sender: nil)
            
        }
        
        
        
        
        
    }
    
    
       
       @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var newWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(accountInstance)
        newWordTextField.text = ""
        arrayOfWords = words.getListOfWords()
    }

    @IBAction func confirmPressed(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "Are you sure?", message: "Word will be saved.", preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.addWord() //call the addWord function
          }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
          print("User cancels")
          }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func addWord(){
        guard let newWord = newWordTextField.text else { return  }
        words.saveNewWordToCoreData(word: newWord)
        viewDidLoad()
        
    }
    
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sens the account instance to the main menu page
        let noun = selectedWord.EnglishWord
        let translation = selectedWord.TranslatedWord
        
        if segue.identifier == "segueToDrawNoun" {
            let drawNounView = segue.destination as! DrawNoun
            drawNounView.noun = noun //sends the noun and translation
            drawNounView.translation = translation
        }
        
    }
    
}
