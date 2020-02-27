//
//  storyViewController.swift
//  ELLApp
//
//  Created by Joseph McGeever on 20/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//




import UIKit

class storyViewController: UITableViewController {
    
    let storyData = story()
    var arrayOfStories : [story.StoryStruct] = []
    var selectedStory = story.StoryStruct()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        arrayOfStories = storyData.getStoryDetails()
        
        
        //self.cellLayoutMarginsFollowReadableWdth = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //do not want to segregate yet - maybe if we wish to implement a difficulty setting
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfStories.count //return the number of stories in the array
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath)
        let story = arrayOfStories[indexPath.row] //current cell is current story
        // Configure the cell...
        var completedStatus = "Not yet completed"
        if(story.completed){
            completedStatus = "Completed!"
        }
        cell.textLabel?.text = story.title
        cell.detailTextLabel?.text = story.description + " - " + completedStatus
        cell.imageView?.image = UIImage(named : story.imageFile) //sets the title image here

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //perform a segue to the title page, sending the stories title along with it
        selectedStory = arrayOfStories[indexPath.row] //set the selected story so can be sent in the prepare for segue function beneath
        performSegue(withIdentifier: "segueToStory", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sens the account instance to the main menu page
        if segue.identifier == "segueToStory" {
            let storyView = segue.destination as! StoryTitle
            storyView.book = selectedStory //send the selected story to the title page
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
