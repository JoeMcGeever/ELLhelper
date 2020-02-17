//
//  storyTitle.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class TranslateIntroductionViewController: UIViewController {

    //this view is mostly visual, with an unwind segue
    
    //the way the stories should work:
    //a user selects the story they want to read from a table view scroll
    //(the stories should have in the table view: pic, title, description, status (finished / reading etc) and maybe difficulty
    //when selected, the following 3 pages are shown (maybe 2)
    //which hold a template for the stories to populate
    //the second page holds an image section up top, and text atr bottom
    // the stories are stored in core data -> all identifiable by a number / title
    //e.g: story1image1, story1text1, story2image2 ... <-- all ones with prefix story1 is gathered to populate the pages
    //then the second page is looped over story1textN (N) times
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue){ //to unwind segue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
