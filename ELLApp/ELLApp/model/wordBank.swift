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

//its also worth noting, that these need to be in a relationship to the sign in thar created them

class WordBank  {
    
    struct Word { //the structure of accounts, more can be added to accounts now, like progress trackers
        var EnglishWord : String //adds when a new word is initiated
        var TranslatedWord : String //using some form of API to translate the word into the target language - hopefully on the spot. If the translation cannot be found, initialise and keep as blank
        var drawnImage : UIImage //is set as of when the user draws the image for the word
        init(EnglishWord : String) {
            self.EnglishWord = EnglishWord
            self.TranslatedWord = "No translation found"
            self.drawnImage = UIImage(named: "questionmark")! //initialise as a "?" image
        }
    }
    
    func saveNewWordToCoreData(word : String) {

    }
    func saveImageToWord(word : String, image : UIImage){
        //recieves the updated
    }
    
    func getListOfWords() -> [Word] {
        
        return[Word(EnglishWord: "test"), Word(EnglishWord: "test2"), Word(EnglishWord: "test3")]
    }
    
    
    
    
    
    
    //below is teh strutcure for an API async -- might not be the same for google API but it is a start
    
    
    
    
    //   https://www.appcoda.com/google-translation-api/
    
    
    
    struct Response : Codable{ //this is probably the structure of the response sent by the API
        let word : String
        let translation : String
    }
    
    
    func getTranslation(word:String, completionHandler: @escaping (Array<String>) -> ()) {
        //an API request to return a tran of a selection of questions
        let headers = [
            "":
            ""
        ]
        let urlString = "https://something\(word)" //inject into the url
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET" //GET request
        request.allHTTPHeaderFields = headers //include the headers (including my API key)

        let session = URLSession.shared
        session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in //async func here URLSession  { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)

                do{
                    let jsonDecoder = JSONDecoder()
                    let dataObject = try jsonDecoder.decode(Response.self, from: data!)
                    //print("JSON decoded here:")
                    //print(dataObject)
                    
                    
      //              let translation = dataObject.typeOf
      //              completionHandler(translation) //return in the completion handler --> callback
                    
                    
                }
                catch {
                    print("Failed decoding")
                    completionHandler([])
                    
                }
            }
            }).resume()
    
    }
    
}

    
   
