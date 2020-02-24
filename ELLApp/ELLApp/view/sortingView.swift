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
    
    var categories = ["Blue", "Red", "Green"] //In future, through the segue, the categories can be changed. As the only thing the category names should affect is the images displayed, hopefully it should be re-usable for many different games.
    

    var gameInstance : sortingVar.imageStruct? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(gameInstance == nil){ //if this is teh first time the view is loaded, we need to instantiate the structure
            gameInstance = sortingVar.imageStruct(categories: categories) //create instance for game
                       
        } else { //sets all the correct images, and turns user interaction off for images already present
            cat1image1.image = gameInstance?.imageDisplay[0]
            if(gameInstance?.imageDisplay[0] != UIImage(named: "questionmark")!){
                cat1image1.isUserInteractionEnabled = false
            }
            cat1image2.image = gameInstance?.imageDisplay[3]
            if(gameInstance?.imageDisplay[3] != UIImage(named: "questionmark")!){
                cat1image2.isUserInteractionEnabled = false
            }
            cat1image3.image = gameInstance?.imageDisplay[6]
            if(gameInstance?.imageDisplay[6] != UIImage(named: "questionmark")!){
                cat1image3.isUserInteractionEnabled = false
            }
            cat2image1.image = gameInstance?.imageDisplay[1]
            if(gameInstance?.imageDisplay[1] != UIImage(named: "questionmark")!){
                cat2image1.isUserInteractionEnabled = false
            }
            cat2image2.image = gameInstance?.imageDisplay[4]
            if(gameInstance?.imageDisplay[4] != UIImage(named: "questionmark")!){
                cat2image2.isUserInteractionEnabled = false
            }
            cat2image3.image = gameInstance?.imageDisplay[7]
            if(gameInstance?.imageDisplay[7] != UIImage(named: "questionmark")!){
                cat2image3.isUserInteractionEnabled = false
            }
            cat3image1.image = gameInstance?.imageDisplay[2]
            if(gameInstance?.imageDisplay[2] != UIImage(named: "questionmark")!){
                cat3image1.isUserInteractionEnabled = false
            }
            cat3image2.image = gameInstance?.imageDisplay[5]
            if(gameInstance?.imageDisplay[5] != UIImage(named: "questionmark")!){
                cat3image2.isUserInteractionEnabled = false
            }
            cat3image3.image = gameInstance?.imageDisplay[8]
            if(gameInstance?.imageDisplay[8] != UIImage(named: "questionmark")!){
                cat3image3.isUserInteractionEnabled = false
            }
        }
        
        label1.text = categories[0]
        label2.text = categories[1]
        label3.text = categories[2]
        
//        switch gameInstance?.imagePosToUpdate { //depending if this view is being re-loaded
//        case 0:
//            cat1image1.image = gameInstance?.imageToUpdateTo
//        case 3:
//            cat1image2.image = gameInstance?.imageToUpdateTo
//        case 6:
//            cat1image3.image = gameInstance?.imageToUpdateTo
//        case 1:
//            cat2image1.image = gameInstance?.imageToUpdateTo
//        case 4:
//            cat2image2.image = gameInstance?.imageToUpdateTo
//        case 7:
//            cat2image3.image = gameInstance?.imageToUpdateTo
//        case 2:
//            cat3image1.image = gameInstance?.imageToUpdateTo
//        case 5:
//            cat3image2.image = gameInstance?.imageToUpdateTo
//        case 8:
//            cat3image3.image = gameInstance?.imageToUpdateTo
//        default:
//            break
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectImage" {
            let selectionView = segue.destination as! sortingSelection
            selectionView.gameInstance = gameInstance
            
        }
    }
    
    func executeSegue(){
        self.performSegue(withIdentifier: "selectImage", sender: self)
    }
    
    @IBAction func cat1tap1(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 0
        executeSegue()
        
    }

    @IBAction func cat1tap2(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 3
        executeSegue()
        
    }
    
    @IBAction func cat1tap3(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 6
        executeSegue()
        
    }
    
    @IBAction func cat2tap1(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 1
        executeSegue()
        
    }
    
    @IBAction func cat2tap2(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 4
        executeSegue()
    }
    
    @IBAction func cat2tap3(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 7
        executeSegue()
    }
    
    @IBAction func cat3tap1(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 2
        executeSegue()
    }
    
    @IBAction func cat3tap2(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 5
        executeSegue()
    }
    
    @IBAction func cat3tap3(_ sender: Any) {
        gameInstance!.imagePosToUpdate = 8
        executeSegue()
    }
    
}
