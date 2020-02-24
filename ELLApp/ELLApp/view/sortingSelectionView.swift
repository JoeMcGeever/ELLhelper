//
//  sortingSelectionView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 19/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class sortingSelection : UIViewController {

    
    var gameInstance : sortingVar.imageStruct? = nil
    var imageArray : [UIImage] = []
    var selectedChoice : String = "" //which image the user has pressed in the previous view

    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    
    override func viewDidLoad() {
        imageArray = gameInstance!.imageChoices
        image1.image = imageArray[0]
        image2.image = imageArray[1]
        image3.image = imageArray[2]
        image4.image = imageArray[3]
        image5.image = imageArray[4]
        image6.image = imageArray[5]
        image7.image = imageArray[6]
        image8.image = imageArray[7]
        image9.image = imageArray[8]
    }
    
    func chosenImage(imageNumber : Int) {
        //replace the image with the
        //update tracker??
        let lastPageImagePos = gameInstance!.imagePosToUpdate
        let imageToDisplay = imageArray[imageNumber]
        
        
        
        gameInstance?.imageDisplay[lastPageImagePos] = imageToDisplay//sets the image which will be visible in prior view controller
        
        gameInstance!.imageChoices[imageNumber] = UIImage(named: "questionmark")!

        self.performSegue(withIdentifier: "unwindFromSelection", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //pass back the instance
        if segue.identifier == "unwindFromSelection" {
            let selectionView = segue.destination as! sorting
            selectionView.gameInstance = gameInstance
            
        }
    }
    
    @IBAction func press1(_ sender: Any) {
        //send 0
        //update the array so that the removed image is now a questionmark and send it back also
        //then in the prior segue, update the selectedChoice to be the image in array slot 0
        
        
        chosenImage(imageNumber: 0)
        
    }
    
    @IBAction func press2(_ sender: Any) {
        
        
        chosenImage(imageNumber: 1)
        
    }
    
    @IBAction func press3(_ sender: Any) {
        
        chosenImage(imageNumber: 2)
        
    }
    
    @IBAction func press4(_ sender: Any) {
        
        
        chosenImage(imageNumber: 3)
    }
    
    @IBAction func press5(_ sender: Any) {
        
        
        chosenImage(imageNumber: 4)
    }
    
    @IBAction func press6(_ sender: Any) {
        
        
        chosenImage(imageNumber: 5)
    }
    
    @IBAction func press7(_ sender: Any) {
        
        
        chosenImage(imageNumber: 6)
    }
    
    @IBAction func press8(_ sender: Any) {
        
        
        chosenImage(imageNumber: 7)
    }
    
    @IBAction func press9(_ sender: Any) {
        
        
       chosenImage(imageNumber: 8)
    }
    
}
