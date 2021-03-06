//
//  QuestionViewController.swift
//  vocabLearner
//
//  Created by Joseph McGeever on 25/10/2019.
//  Copyright © 2019 Joseph McGeever. All rights reserved.
//
import UIKit
import AVFoundation

class QuestionViewController: UIViewController {
    

    let defaults = UserDefaults.standard
    var user : String = ""
    
    let wordsCoreData = WordBank()
    var player: AVAudioPlayer?
    
    var questions : Array<Question> = [] //holds the array of 10 questions and answers
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet weak var oneQResult: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBAction func nextQuestionButton(_ sender: Any) {
        nextQuestion()
    }
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var drawnImage: UIImageView!
    
    
    var randomNumbers = [0,1,2,3] //holds an array of numbers 0-3
    var a = 0
    var b = 1
    var c = 2
    var d = 3
    
    
    var questionIndex = 0
    var correctAnswers = 0
    
    func displayGameError(){
        let alert = UIAlertController(title: "Cannot play", message: "You need at least 10 words with translations or images to play", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok!", style: .default) { (action) in self.performSegue(withIdentifier: "ResultsSegue", sender : action)}
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidLoad()
        questions = wordsCoreData.getTenPairs(user: user) ?? [Question(text: "", drawnImage: UIImage(named: "questionmark")!, answers: [Answer(text: "", correct: false)])] //populate the questions array
        
        if(questions[0].text == ""){
            //if the user does not have 10 words, then show error
            displayGameError()
            
        }else {
            //otherwise, begin the game
            
            updateUI()
        }
        //get the 10 pairs of words
        //get 10 questions + 4 answers, one correct
  
    }
    
    override func viewDidLoad() {
        user = defaults.string(forKey: defaultsKeys.username)!
    }
    
    func updateUI() {
        oneQResult.text = ""
        nextQuestionButton.isUserInteractionEnabled = false //disable the 'next' button
        button1.isUserInteractionEnabled = true
        button2.isUserInteractionEnabled = true
        button3.isUserInteractionEnabled = true
        button4.isUserInteractionEnabled = true
        nextQuestionButton.setTitleColor(.lightGray, for: .normal) //so user must answer the question
        
        navigationItem.title = "Question \(questionIndex+1)" //display the question number
        let currentQuestion = questions[questionIndex] //store the current question
        let currentAnswers = currentQuestion.answers //and answers
        let totalProgress = Float(questionIndex+1) / Float(questions.count) //and the quesiton number / 10
        
        
        if(currentQuestion.text == ""){
            questionLabel.text = "What is this?"
        } else {
            questionLabel.text = currentQuestion.text //display the question
        }
        drawnImage.image = currentQuestion.drawnImage //displays the image
        progressBar.setProgress(totalProgress, animated: true) //update the progress bar
        
        updateSingleStack(using : currentAnswers) //update tte stack of answers by sending the current answers
    }
    
    func updateSingleStack(using answers: [Answer]) {
        
        randomNumbers = randomNumbers.shuffled() //randomize the list of numbers 0-3
        a = randomNumbers[0]
        b = randomNumbers[1]
        c = randomNumbers[2]
        d = randomNumbers[3]
        //now all of the questions are in a random order
        
        button1.setTitle(answers[a].text, for: .normal)
        button2.setTitle(answers[b].text, for: .normal)
        button3.setTitle(answers[c].text, for: .normal)
        button4.setTitle(answers[d].text, for: .normal)
        //above sets the text for the buttons
        
        
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        var correctAnsPos = 0
        for i in 0...3{ //gets the position of which answer is correct to be displayeed if incorrect answer is selected
            if(questions[questionIndex].answers[i].correct == true) {
                correctAnsPos = i
                break
            }
        }
        switch sender { //decides whether an answer selected is correct or not
        case button1:
            if(questions[questionIndex].answers[a].correct == true) { //if the item selected is has the property "true" for correct answer
                correctAnswers += 1 //increment score
                oneQResult.text = "Correct!" // display correct
                playSound(fileName: "ding")
            } else {
                oneQResult.text = "Incorrect. The correct answer is: \(questions[questionIndex].answers[correctAnsPos].text)" //othereise display correct answer
                playSound(fileName: "incorrect")
            }
        case button2:
            if(questions[questionIndex].answers[b].correct == true) {
                correctAnswers += 1
                oneQResult.text = "Correct!"
                playSound(fileName: "ding")

            } else {
                oneQResult.text = "Incorrect. The correct answer is: \(questions[questionIndex].answers[correctAnsPos].text)"
                playSound(fileName: "incorrect")
                
            }
        case button3:
            if(questions[questionIndex].answers[c].correct == true) {
                correctAnswers += 1
                oneQResult.text = "Correct!"
                playSound(fileName: "ding")
                
            } else {
                oneQResult.text = "Incorrect. The correct answer is: \(questions[questionIndex].answers[correctAnsPos].text)"
                playSound(fileName: "incorrect")
                
            }
        case button4:
            if(questions[questionIndex].answers[d].correct == true) {
                correctAnswers += 1
                oneQResult.text = "Correct!"
                playSound(fileName: "ding")
            } else {
                oneQResult.text = "Incorrect. The correct answer is: \(questions[questionIndex].answers[correctAnsPos].text)"
                playSound(fileName: "incorrect")
                
            }
        default:
            break
        }
        button1.isUserInteractionEnabled = false
        button2.isUserInteractionEnabled = false
        button3.isUserInteractionEnabled = false
        button4.isUserInteractionEnabled = false
        nextQuestionButton.isUserInteractionEnabled = true  //allow users to select next question button
        nextQuestionButton.setTitleColor(.none, for: .normal)
        
    }
    
    func nextQuestion() { //when user clciks next question
        questionIndex += 1 // increment question number
        if questionIndex < questions.count { //if there are more questions, repeat game for next q
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil) //otherwise, programatic segue to results page
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //before segue is completed, set the results variable on the other file to equal this result
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.correctAnswers = correctAnswers
        }
    }
    
}
