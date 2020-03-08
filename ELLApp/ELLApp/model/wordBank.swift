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
        init(EnglishWord : String, translatedWord : String, drawnImage : UIImage) {
            self.EnglishWord = EnglishWord
            self.TranslatedWord = translatedWord
            self.drawnImage = drawnImage //UIImage(named: "questionmark")!
        }
    }
    
    func saveNewWordToCoreData(user : String, word : String, targetLanguage : String) {
        
        let context = self.appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "WordBankCore", in: context)
        let newWord = NSManagedObject(entity: entity!, insertInto: context)
        
        
        TranslationManager.shared.textToTranslate = word //set the word to translate
        TranslationManager.shared.targetLanguageCode = targetLanguage //and its target language
        TranslationManager.shared.translate(completion: { (translation) in

              if var translation = translation {
                if(translation == ""){
                    translation = "No translation found"
                    
                }
                    DispatchQueue.main.async { [unowned self] in
                    newWord.setValue(user, forKey: "user")
                    newWord.setValue(translation, forKey: "translation")
                    newWord.setValue(word, forKey: "englishWord")
                        
                       // haven't saved image
                        do {
                           try context.save()
                            //success
                          } catch {
                           print("Failed saving")
                        }
                        
                    }
                } else {
                     DispatchQueue.main.async { [unowned self] in
                     newWord.setValue(user, forKey: "user")
                     newWord.setValue("No translation found", forKey: "translation")
                     newWord.setValue(word, forKey: "englishWord")
                                        
                    do {
                        try context.save()
                        //success
                    } catch {
                        print("Failed saving")
                    }
                }
            }
                
        })
    }
    
    
    func saveImageToWord(user: String, word : String, image : UIImage){
        //recieves the updated
        
        let imageData: NSData = image.pngData()! as NSData
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "WordBankCore")
        fetchRequest.predicate = NSPredicate(format: "englishWord = %@ AND user = %@", word, user)
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
    
    func deleteWordImage(user : String, word : String){
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "WordBankCore")
        fetchRequest.predicate = NSPredicate(format: "englishWord = %@ AND user = %@", word, user)
        do {
                let test = try context.fetch(fetchRequest)
                let itemUpdate = test[0] as! NSManagedObject
                itemUpdate.setValue(nil, forKey: "image")
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
    
    func deleteWord(user: String, word : String) {
        //refer to persistant container
        let context = appDelegate.persistentContainer.viewContext
               //create the context
                           
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "WordBankCore")
        fetchRequest.predicate = NSPredicate(format: "user = %@ AND englishWord = %@", user, word)
               
        let objects = try! context.fetch(fetchRequest)
        for obj in objects {
            context.delete(obj as! NSManagedObject)
        }
               
        do {
            try context.save() // <- remember to put this :)
        } catch {
            print("Failed")
        }
        print("Deleted")
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
        var image : NSData?
        var currentInstance : NSManagedObject
        var imageUI : UIImage? = UIImage(named: "questionmark")!
        
        
        for i in 0...objects.count - 1 {

            currentInstance = objects[i]
            
            instanceUser = currentInstance.value(forKey: "user") as? String ?? ""
            
            
            engWord = currentInstance.value(forKey : "englishWord") as? String ?? ""
            translation = currentInstance.value(forKey : "translation") as? String ?? ""

            
            image  = currentInstance.value(forKey: "image") as? NSData ?? nil
            if image == nil{ //if user has no image already

                imageUI = UIImage(named: "questionmark") // or UIImage(named: "questionmark")! if not exist
            } else {
                imageUI = UIImage(data: image! as Data)
            }
            
            
            if(instanceUser == user){
                listOfUserWords.append(Word(EnglishWord: engWord, translatedWord: translation, drawnImage: imageUI ?? UIImage(named: "questionmark")!))
                
            }
        }
    
        return listOfUserWords
    }
    
    
    
    func getTenPairs(user : String) -> Array<Question>?{
        
        //this will be easier with a layer
        //an advantage of core data is the ability to get all from it with little impact to performance due to a mechanism called "faulting"
        //get all into array
        //shuffle array
        //take first 10
        
        var questions =  [Question]()
        
//        let context = appDelegate.persistentContainer.viewContext
//
//
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Words")
//        //fetchRequest.returnsObjectsAsFaults = false //THIS DISABLES FAULTING
//
//        var objects = try! context.fetch(fetchRequest) as! [NSManagedObject]
        
        let allWordObjects = getListOfWords(user: user)
        
        var objects : [Word] = []
        var question = ""
        var answer : Answer
        var wrongAnswer1: Answer
        var wrongAnswer2: Answer
        var wrongAnswer3: Answer
        
        //print(objects[0])
        //print(objects[0].value(forKey: "origin") ?? "No value")
    
        
        for i in 0...allWordObjects.count - 1{ //all words in the word bank must either have an associated image or a translation
            if(allWordObjects[i].TranslatedWord != "No translation found" || allWordObjects[i].drawnImage != UIImage(named: "questionmark")){
                objects.append(allWordObjects[i])
            }
        }
        
        let numberOfPairs = objects.count
        
        
        if(numberOfPairs < 10) {
            return nil //NOTE AN EMPTY ARRAY WILL BE RETURNED
            //IF NOT AT LEAST 10 ENTRIES
        }
        
        objects = objects.shuffled() //re-orders array
        var random1 : Int
        var random2: Int
        var random3: Int
        
        for i in 0...9 {
            random1 = i
            random2 = i
            random3 = i
            while(random1 == i || random2 == i || random3 == i || random1 == random2 || random1 == random3 || random2 == random3){
                random1 = Int.random(in: 0...numberOfPairs - 1)
                random2 = Int.random(in: 0...numberOfPairs - 1)
                random3 = Int.random(in: 0...numberOfPairs - 1)
            }
            wrongAnswer1 = Answer(text: objects[random1].EnglishWord, correct : false)
             wrongAnswer2 = Answer(text: objects[random2].EnglishWord, correct : false)
             wrongAnswer3 = Answer(text: objects[random3].EnglishWord, correct : false)
            
            if(objects[i].TranslatedWord == "No translation found"){
                question = ""
            } else {
                question = objects[i].TranslatedWord
            }
            
            
            answer = Answer(text: objects[i].EnglishWord, correct : true)
            
            questions.append(Question(text: question, drawnImage: objects[i].drawnImage, answers: [answer, wrongAnswer1, wrongAnswer2, wrongAnswer3]))
            

        }
        
        return questions
    }
    
    
    
}

    
   
