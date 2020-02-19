//
//  matchUpView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 18/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation //to work with audio


class matchUp : UIViewController {
    
    
    var questionIndex = 0
    var questions  = ["Red", "Yellow", "Blue", "Purple", "Orange", "Green"].shuffled() //randomizes this order
    var utteranceRate : Float = 0.1
    
    @IBAction func unwindToMatchUp(segue: UIStoryboardSegue) {} //so the gesture on the correct page will return it to this page
    
    @IBAction func playButton(_ sender: Any) {
        //here it should play the relevant sound
        let currentWord = questions[questionIndex]
        let utterance = AVSpeechUtterance(string: currentWord)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = utteranceRate
        
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func nextQuestion() {
    questionIndex += 1
        if questionIndex >= questions.count { //if there are no more questions
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil) //programatically segue which should work once set up with the rest of the program
            
            
            
            print("ALL done")
            
            
        }
    }
    
    
    
    
    
    
        
    
    
    
    func correct() {
        //segue to correct screeen (present over the top of page)
        //send the colour also to affect display
        performSegue(withIdentifier: "correctSegue", sender: nil) //programatically segue
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sens the account instance to the main menu page
        if segue.identifier == "correctSegue" {
            let correctView = segue.destination as! correctMatch
            correctView.colour = questions[questionIndex]
        }
        
    }

    
    
    
    
    @IBAction func green(_ sender: Any) {
        //if incorrect, do nothing (or play an error sound)
        //if correct, display image larger with "well done", and reload view with next answers etc
        if(questions[questionIndex] == "Green"){
            correct()
        } else {
            let utterance = AVSpeechUtterance(string: "Try again")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = utteranceRate
            
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            
        }
        
    }
    
    
    
    @IBAction func orange(_ sender: Any) {
        if(questions[questionIndex] == "Orange"){
            correct()
        } else {
            let utterance = AVSpeechUtterance(string: "Try again")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = utteranceRate
            
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            
        }
        
    }
    
    @IBAction func red(_ sender: Any) {
        if(questions[questionIndex] == "Red"){
            correct()
        } else {
            let utterance = AVSpeechUtterance(string: "Try again")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = utteranceRate
            
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            
        }
    }
    
    
    @IBAction func yellow(_ sender: Any) {
        if(questions[questionIndex] == "Yellow"){
            correct()
        } else {
            let utterance = AVSpeechUtterance(string: "Try again")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = utteranceRate
            
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            
        }
    }
    
    
    @IBAction func purple(_ sender: Any) {
        if(questions[questionIndex] == "Purple"){
            correct()
        } else {
            let utterance = AVSpeechUtterance(string: "Try again")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = utteranceRate
            
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            
        }
        
    }
    
    
    @IBAction func blue(_ sender: Any) {
        if(questions[questionIndex] == "Blue"){
            correct()
        } else {
            let utterance = AVSpeechUtterance(string: "Try again")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                utterance.rate = utteranceRate
            
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            
        }
    }
    
    
    
    

    

    
    

    
}
