//
//  matchUpCorrectView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 19/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class correctMatch : UIViewController {
    
    var colour : String = ""
    var completed : Bool = false
    var player: AVAudioPlayer?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var lastItemLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named : colour)
        label.text = colour + "!"
        
        let utterance = AVSpeechUtterance(string: "Well done!")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.5
        
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        
        if(completed){
            lastItemLabel.text = "You have completed the game!"
            playSound()
        }
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
