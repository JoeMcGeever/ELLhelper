//
//  storyFinishedView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 20/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class storyFinished: UIViewController {
    
    let storyData = story()
    //ask a few questions here about the story perhaps
    //load up from coreData - a seperate store should be for the questions
    
    var text : String = ""
    @IBOutlet weak var labelForText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelForText.text = "Well done on finishing: " + text + "!"
        storyData.updateCompletionOfStory(title: text)
    }
    
}
