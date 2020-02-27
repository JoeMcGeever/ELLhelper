//
//  nounUserImage.swift
//  ELLApp
//
//  Created by Joseph McGeever on 27/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import CoreData
import UIKit

//can save a UIImage to core data along with its noun
//when a user wishes to see the image they drew for the noun, then the program sends the relevant noun, and returns the image :D


//as a standard for this actually; when a new word is added to the word bank, the translation should also be added (but not visible in the tableview of words (only display if absolutely necessary)) ->

class WordBank {
    
    struct Word { //the structure of accounts, more can be added to accounts now, like progress trackers
        var EnglishWord : String //adds when a new word is initiated
        var TranslatedWord : String //using some form of API to translate the word into the target language - hopefully on the spot. If the translation cannot be found, initialise and keep as blank
        var drawnImage : UIImage //is set as of when the user draws the image for the word
        init(EnglishWord : String) {
            self.EnglishWord = EnglishWord
            self.TranslatedWord = ""
            self.drawnImage = UIImage(named: "questionmark")! //initialise as a "?" image
        }
    }
    
    func saveNewWordToCoreData(word : String) {
        
    }
    func saveImageToWord(word : String){
        
    }
    
    func getListOfWords() -> [Word] {
        
        return[Word(EnglishWord: "test")]
    }
    
    
}

    
   
