//
//  storyTitle.swift
//  ELLApp
//
//  Created by Joseph McGeever on 17/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//


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



import Foundation
import UIKit

class StoryTitle: UIViewController {
    
    //let book = story.AccountStruct() //this should be populated with the relevant details from the table view prior to this view
    
    
    //CHANGED BOOK TO THIS TEST FOR TEST PURPOSES
    var book = story.StoryStruct(title: "Test", description: "This is a test book", completed: false, text: ["Page 1", "Page 2", "Page 3"])
    
    

    
    @IBOutlet weak var titleText: UILabel!
    @IBAction func beginButton(_ sender: Any) {
        self.performSegue(withIdentifier: "beginStorySegue", sender: self)
    }
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue){ //to unwind segue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = book.title
    }
    
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           //sens the account instance to the main menu page
           if segue.identifier == "beginStorySegue" {
               let pageView = segue.destination as! PageView
               pageView.book = book
           }
           
       }

}
