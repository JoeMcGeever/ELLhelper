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
    
    var words = WordBank()
    var selectedWord = WordBank.Word(EnglishWord: "", translatedWord: "", drawnImage: UIImage(named: "questionmark")!)
    var selectedWordIndex = 0
    
    var accountInstance = User.AccountStruct(username: "", homeLanguage: "") //this gets populated with an account instance from the menu page
    let defaults = UserDefaults.standard
    
    
    
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
        selectedWordIndex = indexPath.row
    
        
        if(selectedWord.drawnImage != UIImage(named: "questionmark")){
            
            //segue to show the image (send the word with the segue so the translation can be seen if still unable to remember

            performSegue(withIdentifier: "displayUserImage", sender: nil)
            
            
        } else {
            //show the translation of what it is
            //segue to the draw part, sending the word so the noun can be displayed at the top
            //and then can also save the image for taht noun
            performSegue(withIdentifier: "segueToDrawNoun", sender: nil)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { //enable swipe to delete
     if editingStyle == .delete {
        selectedWord = arrayOfWords[indexPath.row]
        self.words.deleteWord(user: accountInstance.username, word: selectedWord.EnglishWord)
        viewDidLoad()
     }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    
       
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var newWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountInstance.username = defaults.string(forKey: defaultsKeys.username)!
        
        newWordTextField.text = ""
        arrayOfWords = words.getListOfWords(user: accountInstance.username)
        tableView.reloadData()
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
        words.saveNewWordToCoreData(user : accountInstance.username, word: newWord)
        viewDidLoad()
        
    }
    
    @IBAction func quizButton(_ sender: Any) {
        performSegue(withIdentifier: "segueToBankQuiz", sender: nil)
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "segueToBankQuiz" {
            let quizView = segue.destination as! wordBankQuizTitle
            quizView.accountInstance = accountInstance
        }
        
        if segue.identifier == "segueToDrawNoun" {
            
            let noun = selectedWord.EnglishWord
            let translation = arrayOfWords[selectedWordIndex].TranslatedWord
            
            let drawNounView = segue.destination as! DrawNoun
            drawNounView.noun = noun //sends the noun and translation
            drawNounView.translation = translation
            drawNounView.accountInstance = accountInstance
        }
        
        if segue.identifier == "displayUserImage" {
            
            let userImageView = segue.destination as! UserImageView
            userImageView.accountInstance = accountInstance
            userImageView.selectedWord = selectedWord
        }
        
    }
    
}
