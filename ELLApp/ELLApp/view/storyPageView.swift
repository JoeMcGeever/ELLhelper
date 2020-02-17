//
//  storyPageView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit


class  StoryPageView : UIViewController {
    
    var text : String = ""
    @IBOutlet weak var labelForText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelForText.text = text
    }
    
}
