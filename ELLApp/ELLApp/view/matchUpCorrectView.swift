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
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named : colour)
        label.text = colour + "!"
        
        let utterance = AVSpeechUtterance(string: "Well done!")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.5
        
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
    }
    
    
}
