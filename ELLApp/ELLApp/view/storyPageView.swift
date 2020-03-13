//
//  storyPageView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation



class  StoryPageView : UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var textField: UITextField!
    var text : String = ""
    @IBOutlet weak var labelForText: UILabel!
    let wordBank = WordBank()
    @IBOutlet weak var audioImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelForText.text = text
        audioImage.image = UIImage(named: "earImage")
    }
    
    @IBAction func addToWordBank(_ sender: Any) {
        let word = textField.text!
        if(textField.text == nil) {
            print("Nothing")
            return
        }
        print("Want to save: " + word) //need to send account details - or word bank a singleton class -> which may be better
        textField.text = nil
        let user = defaults.string(forKey: defaultsKeys.username)!
        wordBank.saveNewWordToCoreData(user: user, word: word)
    }
    
    @IBAction func audioTapped(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
    }
}
