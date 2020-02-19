//
//  colourSortingView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 19/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class sorting : UIViewController {
    //programatically choose the labels
    //get 9 pictures, 3 conforming to each category
    //when a user presses an image box, the segue should display the 9 images
    //user then presses the image that he wants to populate the prior pressed box with
    //this image should then be removed from the list of images
    //continue until none are left
    //note - pressing a picture which has already been placed will give the option to replace with another (A question mark option should always be available as a result)
    //check button at the end will then highlight / tick and cross
    //for every category -> have at least 3 images saved in the format; '[categoryNameHere]n' where n is a number
    
    //scratch all of that. Cannot get filename as it breaks MVC. More thinking is required...
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var cat1image1: UIImageView!
    @IBOutlet weak var cat1image2: UIImageView!
    @IBOutlet weak var cat1image3: UIImageView!
    
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var cat2image1: UIImageView!
    @IBOutlet weak var cat2image2: UIImageView!
    @IBOutlet weak var cat2image3: UIImageView!
    
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var cat3image1: UIImageView!
    @IBOutlet weak var cat3image2: UIImageView!
    @IBOutlet weak var cat3image3: UIImageView!

    var categories = ["Blue", "Red", "Green"].shuffled() //In future, through the segue, the categories can be changed. As the only thing the category names should affect is the images displayed, hopefully it should be re-usable for many different games.
    var imageChoices : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = categories[0]
        label2.text = categories[1]
        label3.text = categories[2]
        
        var stringify : String
        
        for i in 0...2 {
            for n in 0...2 {
                stringify = String(n)
                imageChoices.append(UIImage(named: categories[i] + stringify) ?? UIImage(named: "questionmark")!) //populates an array of the correct images - note, the original array maintains the string and the name of the file (can therefore be used to trace if answers are correct if we shuffle this array and display the images thusly)
            }
        }
        
        
        
        
        
        
    }
    
    
}
