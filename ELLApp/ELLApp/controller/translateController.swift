//
//  translateController.swift
//  ELLApp
//
//  Created by Joseph McGeever on 01/03/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation


class TranslationManager: NSObject {
 
    static let shared = TranslationManager() //so this class is singleton
 
    private let apiKey = "AIzaSyDI_mVKWuLP5ml6RkkplWne1iDRr_KC2GA" //my google translate API
 

    var textToTranslate: String?
     
    var targetLanguageCode: String?

    struct TranslationLanguage {
        var code: String? //example: "en"
        var name: String? //example: "English"
    }
    var supportedLanguages = [TranslationLanguage]()
    
    override init() {
        super.init()
    }
    
    //TranslationAPI is an enum in translationAPI file
    private func makeRequest(usingTranslationAPI api: TranslationAPI, urlParams: [String: String], completion: @escaping (_ results: [String: Any]?) -> Void) {
        //completion handler will return data to func that called it or nill -- promise for async
        if var components = URLComponents(string: api.getURL()) {
            //URLComponents contains an array: queryItems, which takes URLQueryItem items.
            components.queryItems = [URLQueryItem]()
            
            for (key, value) in urlParams { //initialise URLCompnent items and append Queryitems one by one
                components.queryItems?.append(URLQueryItem(name: key, value: value))
            }
            
            if let url = components.url {
                   var request = URLRequest(url: url)
                   request.httpMethod = api.getHTTPMethod() //e.g POST or GET - one for translating and one for gettign target language
                
                   let session = URLSession(configuration: .default) //create the URL session
                   let task = session.dataTask(with: request) { (results, response, error) in //data task that will do the URL request
                       //when the above task finished -> it returns the results, response (code) and an error (if any, nil otherwise)
                       if let error = error {
                           print(error)
                           completion(nil) //error
                       } else {
                           if let response = response as? HTTPURLResponse, let results = results {
                               if response.statusCode == 200 || response.statusCode == 201 { //status codes meaning request was successful
                                   do {
                                       if let resultsDict = try JSONSerialization.jsonObject(with: results, options: JSONSerialization.ReadingOptions.mutableLeaves) as? [String: Any] {
                                           completion(resultsDict)
                                       }
                                   } catch {
                                       print(error.localizedDescription)
                                   }
                               }
                           } else {
                               completion(nil) //response code implies something wrong happened
                           }
                       }                   }
                   
                   task.resume()
                
               }
        }
     
    }
    
    
    //gets the supported languages this API offers
    func fetchSupportedLanguages(completion: @escaping (_ success: Bool) -> Void) {
        //URL param must be: The API key, target language for results ("en") and the translation model
        
        var urlParams = [String: String]()
        urlParams["key"] = apiKey
        urlParams["target"] = "en" //want the language display name ot be English
        
        makeRequest(usingTranslationAPI: .supportedLanguages, urlParams: urlParams) { (results) in
            guard let results = results else { completion(false); return }
         
            if let data = results["data"] as? [String: Any], let languages = data["languages"] as? [[String: Any]] {

                for lang in languages {
                    var languageCode: String?
                    var languageName: String?
                    if let code = lang["language"] as? String {
                        languageCode = code
                    }
                    if let name = lang["name"] as? String {
                        languageName = name
                    }
                    self.supportedLanguages.append(TranslationLanguage(code: languageCode, name: languageName)) //create a TranslationLanguage object which we append to the supportedLanguages array created above
                }

                completion(true)

            } else {
                completion(false)
            }

        }
     
    }
    
    func translate(completion: @escaping (_ translations: String?) -> Void) {
        //translates text to target language
        guard let textToTranslate = textToTranslate, let targetLanguage = targetLanguageCode else { completion(nil); return }
        //need to put in URL: api key, text to translate, in param called q, target language. format of returned text: html or text
        var urlParams = [String: String]()
           urlParams["key"] = apiKey
           urlParams["q"] = textToTranslate
           urlParams["target"] = targetLanguage
           urlParams["format"] = "text"
        
           makeRequest(usingTranslationAPI: .translate, urlParams: urlParams) { (results) in
                  guard let results = results else { completion(nil); return }
  
                    if let data = results["data"] as? [String: Any], let translations = data["translations"] as? [[String: Any]] {
                        var allTranslations = [String]()
                        for translation in translations {
                        if let translatedText = translation["translatedText"] as? String {
                            allTranslations.append(translatedText)
                            }
                        }
             
                        if allTranslations.count > 0 {
                            completion(allTranslations[0])
                        } else {
                            completion(nil)
                        }
             
             
                    } else {
                        completion(nil)
                }
                }
        
    }
    
}
