//
//  sortingVariables.swift
//  ELLApp
//
//  Created by Joseph McGeever on 24/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class sortingVar {
    
    //holds all the relevant data between each views (sorting view and sorting selection view)
    
    struct imageStruct {
        var categories : [String]
        var imageChoices : [UIImage] = []
        var tracker : [String] = [] //this will track the shuffling of imageChoices so I will know what category a selected image will belong to
        
        init(categories : [String]){
            self.categories = categories
            var stringify : String
            
            for i in 0...2 {
                for n in 0...2 {
                    stringify = String(n)
                    imageChoices.append(UIImage(named: categories[i] + stringify) ?? UIImage(named: "questionmark")!) //populates an array of the correct images - note, the original array maintains the string and the name of the file (can therefore be used to trace if answers are correct if we shuffle this array and display the images thusly)
                    tracker.append(categories[i]) //append as well in this array, the correspoding category
                }
            }
            //below, the two arrays are shuffled in the same way, so I can track the category each image should fall into
            let shuffled_indices = tracker.indices.shuffled()
            tracker = shuffled_indices.map { tracker[$0] }
            imageChoices = shuffled_indices.map { imageChoices[$0] }
        }
    }
    
    
}
