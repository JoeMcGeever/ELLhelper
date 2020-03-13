  
//
//  ResultsViewController.swift
//  vocabLearner
//
//  Created by Joseph McGeever on 25/10/2019.
//  Copyright © 2019 Joseph McGeever. All rights reserved.
//
import UIKit
import AVFoundation

class ResultsViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    var correctAnswers: Int = 0 //this variable gets updated through a programatic segue
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        scoreLabel.text = "\(correctAnswers)" //display the score
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playSound(fileName: "levelComplete")
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
