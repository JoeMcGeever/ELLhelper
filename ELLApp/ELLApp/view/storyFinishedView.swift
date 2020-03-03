//
//  storyFinishedView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 20/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class storyFinished: UIViewController {
    
    let storyData = story()
    //ask a few questions here about the story perhaps
    //load up from coreData - a seperate store should be for the questions
    var player: AVAudioPlayer?
    var text : String = ""
    @IBOutlet weak var labelForText: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelForText.text = "Well done on finishing: " + text + "!"
        storyData.updateCompletionOfStory(title: text)
        playSound()
    }
    
     func playSound() { //plays a success sound
           guard let url = Bundle.main.url(forResource: "levelComplete", withExtension: "mp3") else { return }

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
