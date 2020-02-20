//
//  storyData.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class story {
    
    struct StoryStruct { //the structure of stories
        var title : String
        var imageFile : String
        var description : String
        //var pageNumber : Int //this is updated through each readin session. Might'n need
        var completed : Bool
        //var numberOfPages: Int //mightn't need but might be useful
        var text : [String] // all the pages of text
        //var image : [UIImage] //wait until we know more first
        init(title : String = "", //an init so blank versions can be instantiated
            imageFile : String = "Red0",
             description : String = "",
             completed : Bool = false,
             text : [String] = []){
            self.title = title
            self.imageFile = imageFile
            self.description = description
            self.completed = completed
            self.text = text
        }
        
    }
    
    func getStoryDetails() -> [StoryStruct]{
        //function should return an array of stories
        let book = StoryStruct(title: "test", description: "this is for text purposes", completed: false, text: ["first page", "second page", "third page"])
        let book2 = StoryStruct(title: "test2", description: "this is for text purposes2", completed: true, text: ["first page", "second page", "third page"])
        
        let books = [book, book2]
        
        return books
    }
    
    func updateCompletionOfStory(title : String) {
        //updates the status of the book
    }
    
    func getBook(title : String) -> StoryStruct{
        let book = StoryStruct(title: "test", description: "this is for text purposes", completed: false, text: ["first page", "second page", "third page"])
        return book
    }
    
    
}
