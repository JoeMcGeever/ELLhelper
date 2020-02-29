//
//  wordAssociation.swift
//  ELLApp
//
//  Created by Joseph McGeever on 29/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class WordAssociation : UIViewController {
    
    var player: AVAudioPlayer?
    var wordToAssociate : String = ""
    var score = -1
    var seconds = 60
    var timer = Timer()
    @IBOutlet weak var wordToAssociateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         let alert = UIAlertController(title: "Word Association", message: "Enter a word", preferredStyle: .alert)

               //Add the text field
               alert.addTextField(configurationHandler: { (textField) -> Void in
                   textField.text = ""
               })

               //Grab the value from the text field
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (action) -> Void in
                   let textField = alert?.textFields![0]
                   self.wordToAssociate = textField?.text ?? ""
                self.viewDidLoad()
                
               }))

               self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordToAssociateLabel.text = wordToAssociate
    }


    
    @IBAction func greenButtonTapped(_ sender: Any) {
        if(score == -1){
            //then user has pressed the green button to start the game
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WordAssociation.counter), userInfo: nil, repeats: true)
            
            
            
            playSound(fileName: "startTimer") 
            
            score += 1
            
        } else {
            score += 1
            scoreLabel.text = String(score)
            playSound(fileName: "ding")
            
        }
    }
    
    @objc func counter(){
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if(seconds == 0){
            timer.invalidate() //stop timer
            
            //display results
            playSound(fileName: "levelComplete")
            
            let alert = UIAlertController(title: "Well done!", message: "You Scored: \(String(score))", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                self.performSegue(withIdentifier: "unwindSegue", sender: self) //might not work

              }))
            present(alert, animated: true, completion: nil)
            
            
        }
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
