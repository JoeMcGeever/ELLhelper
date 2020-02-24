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
    //this image should then be removed from the list of images and replaced (same pos) with a "?"
    //continue until none are left
    //note - pressing a picture which has already been placed will give the option to replace with another (A question mark option should always be available as a result)
    //check button at the end will then highlight / tick and cross
    //for every category -> have at least 3 images saved in the format; '[categoryNameHere]n' where n is a number
    
    
    
    
    
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
    

    var gameInstance : sortingVar.imageStruct? = nil
    
    
    var selectedChoice : String = "" // this is updated to be the corresponding variable name that needs to be updated -- use a switch case to differentiate which variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameInstance = sortingVar.imageStruct(categories: categories) //create instance for game
        label1.text = categories[0]
        label2.text = categories[1]
        label3.text = categories[2]
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectImage" {
            let selectionView = segue.destination as! sortingSelection
            selectionView.gameInstance = gameInstance
        }
    }
    
    func executeSegue(selectedChoice : String){
        self.performSegue(withIdentifier: "selectImage", sender: self)
    }
    
    @IBAction func cat1tap1(_ sender: Any) {
        selectedChoice = "cat1image1"
        executeSegue(selectedChoice: selectedChoice)
        
    }

    @IBAction func cat1tap2(_ sender: Any) {
        selectedChoice = "cat1image2"
        executeSegue(selectedChoice: selectedChoice)
        
    }
    
    @IBAction func cat1tap3(_ sender: Any) {
        selectedChoice = "cat1image3"
        executeSegue(selectedChoice: selectedChoice)
        
    }
    
    @IBAction func cat2tap1(_ sender: Any) {
        selectedChoice = "cat2image1"
        executeSegue(selectedChoice: selectedChoice)
        
    }
    
    @IBAction func cat2tap2(_ sender: Any) {
        selectedChoice = "cat2image2"
        executeSegue(selectedChoice: selectedChoice)
    }
    
    @IBAction func cat2tap3(_ sender: Any) {
        selectedChoice = "cat2image3"
        executeSegue(selectedChoice: selectedChoice)
    }
    
    @IBAction func cat3tap1(_ sender: Any) {
        selectedChoice = "cat3image1"
        executeSegue(selectedChoice: selectedChoice)
    }
    
    @IBAction func cat3tap2(_ sender: Any) {
        selectedChoice = "cat3image2"
        executeSegue(selectedChoice: selectedChoice)
    }
    
    @IBAction func cat3tap3(_ sender: Any) {
        selectedChoice = "cat3image3"
        executeSegue(selectedChoice: selectedChoice)
    }
    
}
