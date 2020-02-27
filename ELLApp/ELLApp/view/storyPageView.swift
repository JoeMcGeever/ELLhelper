//
//  storyPageView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

//https://www.hackingwithswift.com/example-code/media/how-to-highlight-text-to-speech-words-being-read-using-avspeechsynthesizer -->if I do not implement human speaking over the top


class  StoryPageView : UIViewController {
    
    var text : String = ""
    @IBOutlet weak var labelForText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelForText.text = text
    }
    
}
