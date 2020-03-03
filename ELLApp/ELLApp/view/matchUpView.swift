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
    var unshuffledQuestions = ["Red", "Yellow", "Blue", "Purple", "Orange", "Green"] //to be changed by segue
    var questions : [ String ] = []
    var utteranceRate : Float = 0.5
    var completed = false
    
    @IBOutlet weak var slowerLabel: UILabel!
    @IBOutlet weak var fasterLabel: UILabel!
    
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    
    @IBAction func unwindToMatchUp(segue: UIStoryboardSegue) {} //so the gesture on the correct page will return it to this page
    
    @IBAction func playButton(_ sender: Any) {
        //here it should play the relevant sound
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else {
        let currentWord = questions[questionIndex]
        let utterance = AVSpeechUtterance(string: currentWord)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = utteranceRate
        
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = unshuffledQuestions.shuffled()
        //make images the sent values
        image0.image = UIImage(named: unshuffledQuestions[0])
        image1.image = UIImage(named: unshuffledQuestions[1])
        image2.image = UIImage(named: unshuffledQuestions[2])
        image3.image = UIImage(named: unshuffledQuestions[3])
        image4.image = UIImage(named: unshuffledQuestions[4])
        image5.image = UIImage(named: unshuffledQuestions[5])
    }
    

    
    
    @IBAction func fullScreenTouch(_ sender: Any) {
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        }
    }
    
    
    
    
    func correct() {
        //segue to correct screeen (present over the top of page)
        //send the colour also to affect display
        performSegue(withIdentifier: "correctSegue", sender: nil) //programatically segue
        
    
        questionIndex += 1
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sens the account instance to the main menu page
        if segue.identifier == "correctSegue" {
            let correctView = segue.destination as! correctMatch
            correctView.colour = questions[questionIndex]
            if(questionIndex==questions.count - 1){
                completed = true
                correctView.completed = true
            }
        }
        
    }

    @IBAction func slower(_ sender: Any) {
        //decrease utterance rate
        //set the faster text to not be faded
        //if slow limit is reached, set slower label to grey
        fasterLabel.textColor = .black
        print(utteranceRate)
        if(utteranceRate > 0.2) {
            utteranceRate-=0.15
        } else if(utteranceRate <= 0.2) {
            slowerLabel.textColor = .lightGray
        }
        
    }
    
    @IBAction func faster(_ sender: Any) {
        slowerLabel.textColor = .black
        print(utteranceRate)
        if(utteranceRate < 0.65) {
            utteranceRate+=0.15
        } else if(utteranceRate >= 0.65) {
            fasterLabel.textColor = .lightGray
        }
        //increase utterance rate
        //set the slower text to not be faded
        //if fast limit is reached, set fast label to grey
    }
    
    
    
    @IBAction func green(_ sender: Any) {
        //if incorrect, do nothing (or play an error sound)
        //if correct, display image larger with "well done", and reload view with next answers etc
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else if(questions[questionIndex] == unshuffledQuestions[0]){
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
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else if(questions[questionIndex] == unshuffledQuestions[1]){
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
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else if(questions[questionIndex] == unshuffledQuestions[2]){
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
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else if(questions[questionIndex] == unshuffledQuestions[3]){
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
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else if(questions[questionIndex] == unshuffledQuestions[4]){
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
        if(completed){
            performSegue(withIdentifier: "unwindToMainMenu", sender: nil)
        } else if(questions[questionIndex] == unshuffledQuestions[5]){
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
