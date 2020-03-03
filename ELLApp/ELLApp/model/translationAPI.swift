//
//  translationAPI.swift
//  ELLApp
//
//  Created by Joseph McGeever on 01/03/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation

//AIzaSyDI_mVKWuLP5ml6RkkplWne1iDRr_KC2GA

    
    enum TranslationAPI {
        case translate
        case supportedLanguages
        
        func getURL() -> String {
               var urlString = ""
        
               switch self {
               case .translate:
                   urlString = "https://translation.googleapis.com/language/translate/v2"
        
               case .supportedLanguages:
                   urlString = "https://translation.googleapis.com/language/translate/v2/languages"
               }
        
               return urlString
        }
        
        func getHTTPMethod() -> String {
            if self == .supportedLanguages {
                return "GET" //Not sending any data, but recieving
            } else {
                return "POST" //We are sending data through a POST request, i.e the word to translate
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    

