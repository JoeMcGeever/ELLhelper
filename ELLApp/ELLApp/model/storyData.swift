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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    struct StoryStruct { //the structure of stories
        var title : String
        var imageFile : String
        var description : String
        var text : [String] // all the pages of text
        //var image : [UIImage] //wait until we know more first
        init(title : String = "", //an init so blank versions can be instantiated
            imageFile : String = "",
             description : String = "",
             completed : Bool = false,
             text : [String] = []){
            self.title = title
            self.imageFile = imageFile
            self.description = description
            self.text = text
        }
        
    }
    
    func getStoryDetails() -> [StoryStruct]{
        //function should return an array of stories

        
        let books = [book, book2, book3]
        
        return books
    }
    
    func updateCompletionOfStory(title : String) {
        //updates the status of the book
    }
    
    func getBook(title : String) -> StoryStruct{
        let book = StoryStruct(title: "test", description: "this is for text purposes", completed: false, text: ["first page", "second page", "third page"])
        return book
    }
    
    
    
    
    let book = StoryStruct(title: "Goldilocks and the three bears", imageFile: "Goldilocks", description: "Goldilocks goes into a house in the forest. What will she find there? ",
                           text: ["Once upon a time there was a little girl. Her name was Goldilocks. She had long, golden hair",
                                  "One day Goldilocks was strolling in the deep, dark forest. She saw a house and knocked on the door. She went inside. Nobody was there.",
                                  "Goldilocks saw three bowls on the table. She was hungry.",
                                  "‘This porridge is too hot! This porridge is too cold! This porridge is just right!’ Goldilocks ate all the porridge.",
                                  "Goldilocks was tired now. ‘This chair is too big! This chair is too big, too! This chair is just right!’ But the chair broke!",
                                  "Goldilocks was very tired. She went upstairs. ‘This bed is too hard! This bed is too soft! This bed is just right!’",
                                  "Soon, the bears came home.",
                                  "‘Someone’s been eating my porridge!’ growled Daddy Bear. ‘Someone’s been eating my porridge!’ whimpered Mummy Bear. ‘Someone’s been eating my porridge - and it’s all gone!’ cried Baby Bear.",
                                  "‘Someone’s been sitting on my chair!’ growled Daddy Bear. ‘Someone’s been sitting on my chair!’ softly said Mummy Bear. ‘Someone’s been sitting on my chair - and it’s broken!’ cried Baby Bear.",
                                   "‘Someone’s been sleeping in my bed!’ shouted Daddy Bear. ‘Someone’s been sleeping in my bed!’ said Mummy Bear. ‘Someone’s been sleeping in my bed - and she’s still there!’ cried Baby Bear.",
                                    "Goldilocks woke up and saw the three bears. ‘Help!’ She ran downstairs and into the forest. She never came back again."])
    
    
    let book2 = StoryStruct(title: "Jack and the beanstalk ", imageFile: "JackBeanstalk", description: "Jack has some magic beans! What will happen when they start to grow in his garden?",
                            text: ["Once upon a time there was a little boy called Jack. He lived with his mother. They were very poor. All they had was an old cow. ",
                                   "One morning, Jack’s mother told Jack to take their cow to market and sell her. On the way, Jack met a mysterious man. He gave Jack some magic beans for the cow. ",
                                   "Jack took the beans and went back home. When Jack’s mother saw the beans she was very angry. She threw the beans out of the window. ",
                                    "The next morning, Jack looked out of the window. There was a giant beanstalk. He went outside and started to climb the massive beanstalk. ",
                                    "He climbed up to the sky through the fluffy clouds. Jack saw a beautiful castle. He went inside. ",
                                    "Jack heard a deep voice. ‘Fee, fi, fo, fum!’ Jack ran into a cupboard. He was very scared. ",
                                    "An enormous giant came into the room and sat down. On the table there was a hen and a golden harp. ",
                                    "‘Lay!’ exclaimed the giant. The hen laid an egg. It was made of gold. ‘Sing!’ shouted the giant. The harp began to sing. Soon the giant was asleep. ",
                                    "Jack quickly jumped out of the cupboard. He took the hen and the golden harp. Suddenly, the harp sang, ‘Help, master!’",
                                    "The giant woke up and shouted, ‘Fee, fi, fo, fum!’ Jack ran and started climbing down the beanstalk. The giant came down after him. ",
                                    "Jack shouted, ‘Mother! Help!’ Jack’s mother took an axe and chopped down the beanstalk. The giant fell and crashed to the ground. Nobody ever saw him again. ",
                                    "With the golden eggs and the magic harp, Jack and his mother lived happily ever after."])
    
    
    let book3 = StoryStruct(title: "Little Red Riding Hood", imageFile: "RedRidingHood", description: "One day Little Red Riding Hood goes to visit her granny. Who will she meet in the wood?",
                            text: ["Little Red Riding Hood lived in a wood with her mother. One day Little Red Riding Hood went to visit her granny. She had a nice cake in her basket. ",
                                   "On her way Little Red Riding Hood met a wolf. ‘Hello!’ said the wolf. ‘Where are you going?’. ‘I’m going to see my grandmother. She lives in a house behind those trees.’",
                                   "The wolf ran to Granny’s house and ate Granny up. He got into Granny’s bed. A little later, Little Red Riding Hood reached the house. She looked at the wolf. ",
                                   "‘Granny, what big eyes you have!’... ‘All the better to see you with!’ said the wolf. ",
                                   "‘Granny, what big ears you have!’... ‘All the better to hear you with!’ said the wolf.",
                                   "‘Granny, what a big nose you have!’... ‘All the better to smell you with!’ said the wolf.",
                                   "‘Granny, what big teeth you have!’... ‘All the better to eat you with!’ shouted the wolf.",
                                   "A woodcutter was in the wood. He heard a loud scream and ran to the house. ",
                                   "The woodcutter hit the wolf over the head. The wolf opened his mouth wide and shouted and Granny jumped out. ",
                                   "The wolf ran away and Little Red Riding Hood never saw the wolf again. ",])
    
    
}
