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


class WordBank : NSManagedObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //refer to persistant container
    
    
    
    struct Word { //the structure of accounts, more can be added to accounts now, like progress trackers
        var EnglishWord : String //adds when a new word is initiated
        var TranslatedWord : String //using some form of API to translate the word into the target language - hopefully on the spot. If the translation cannot be found, initialise and keep as blank
        var drawnImage : UIImage //is set as of when the user draws the image for the word
        init(EnglishWord : String, translatedWord : String) {
            self.EnglishWord = EnglishWord
            self.TranslatedWord = translatedWord
            self.drawnImage = UIImage(named: "questionmark")! //initialise as a "?" image
        }
    }
    
    func saveNewWordToCoreData(user : String, word : String, targetLanguage : String) {
        
        
        TranslationManager.shared.textToTranslate = word //set the word to translate
        TranslationManager.shared.targetLanguageCode = targetLanguage //and its target language
        TranslationManager.shared.translate(completion: { (translation) in

                if let translation = translation {
        
                    DispatchQueue.main.async { [unowned self] in
                    print(translation)

                         print("Save now:")
                         print(word)
                         print("Along with:")
                         print(translation)
                        
                        let context = self.appDelegate.persistentContainer.viewContext
                        let entity = NSEntityDescription.entity(forEntityName: "WordBankCore", in: context)
                        let newUser = NSManagedObject(entity: entity!, insertInto: context)
                        newUser.setValue(user, forKey: "user")
                        newUser.setValue(translation, forKey: "translation")
                        newUser.setValue(word, forKey: "englishWord")
                        
                       // haven't saved image
                        
                        do {
                           try context.save()
                            print("Success")
                          } catch {
                           print("Failed saving")
                        }
                        
                    }
                } else {
                    print("Error")
                }
                })
            
        print("Async however")

        }
    
    
    func saveImageToWord(word : String, image : UIImage){
        //recieves the updated
        
        let imageData: NSData = image.pngData()! as NSData
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "WordBankCore")
        fetchRequest.predicate = NSPredicate(format: "englishWord = %@", word)
        do {
                let test = try context.fetch(fetchRequest)
                print(test)
                let itemUpdate = test[0] as! NSManagedObject
                itemUpdate.setValue(imageData, forKey: "image")
                    do {
                        try context.save()
                        print("Saved")
                    } catch {
                    throw(error)
                    }
        } catch {
                print("error")
        }

    }
    
    
    
    func getListOfWords(user : String) -> [Word] {
        
        var listOfUserWords : [Word] = []
        
        let context = appDelegate.persistentContainer.viewContext
        
              
             
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "WordBankCore")
        //fetchRequest.returnsObjectsAsFaults = false //This disables faulting
              
        let objects = try! context.fetch(fetchRequest) as! [NSManagedObject]
        
        var instanceUser : String
        var engWord : String
        var translation : String
        var currentInstance : NSManagedObject
        
        
        for i in 0...objects.count - 1 {

            currentInstance = objects[i]
            
            instanceUser = currentInstance.value(forKey: "user") as! String
            
            engWord = currentInstance.value(forKey : "englishWord") as! String
            translation = currentInstance.value(forKey : "translation") as! String
            
            if(instanceUser == user){
                listOfUserWords.append(Word(EnglishWord: engWord, translatedWord: translation))
            }
        }
        
        

        
        return listOfUserWords
    }
    
    
    
}

    
   
