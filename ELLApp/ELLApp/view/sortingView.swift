//
//  colourSortingView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 19/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class sorting : UIViewController {
  
    var player: AVAudioPlayer? //play sound
    
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
    
    
    @IBAction func reset(_ sender: Any) { //resets the game by changing the game instance to nill, reverting all images back to a question mark, enabling interaction and calling the viewDidLoad once more
        gameInstance = nil
        let baseImage = UIImage(named: "questionmark")
        cat1image1.image = baseImage
        cat1image1.isUserInteractionEnabled = true
        cat1image2.image = baseImage
        cat1image2.isUserInteractionEnabled = true
        cat1image3.image = baseImage
        cat1image3.isUserInteractionEnabled = true
        cat2image1.image = baseImage
        cat2image1.isUserInteractionEnabled = true
        cat2image2.image = baseImage
        cat2image2.isUserInteractionEnabled = true
        cat2image3.image = baseImage
        cat2image3.isUserInteractionEnabled = true
        cat3image1.image = baseImage
        cat3image1.isUserInteractionEnabled = true
        cat3image2.image = baseImage
        cat3image2.isUserInteractionEnabled = true
        cat3image3.image = baseImage
        cat3image3.isUserInteractionEnabled = true
        viewDidLoad()
    }
    
    @IBAction func check(_ sender: Any) {
        print(gameInstance?.selectionCounter as Any)
        if(gameInstance!.correct == true && gameInstance!.selectionCounter >= 9){//if no pictures were placed in incorrect slot and all images are pressed, then won
            let alert = UIAlertController(title: "Congratulations!", message: "Every answer is correct!!!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                self.performSegue(withIdentifier: "unwindToMain", sender: self) //segue back now completed

              }))
            playSound(fileName: "levelComplete")
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Not quite", message: "Some of the answers are not correct.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                print("Incorrect")
            }))
            playSound(fileName: "incorrect")
            present(alert, animated: true, completion: nil)
            
        }
    }
       
    
    
    
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
    
    func playSound(fileName : String) { //plays a success sound
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
