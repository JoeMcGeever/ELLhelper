//
//  storyViewController.swift
//  ELLApp
//
//  Created by Joseph McGeever on 20/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//




import UIKit

class MatchUpTableView: UITableViewController {
    
    let arrayOfCategories = [["Red", "Yellow", "Blue", "Purple", "Orange", "Green"], ["Tiger", "Horse", "Monkey", "Dog", "Butterfly", "Bird"]]
    let arrayOfCatNames = ["Colour", "Animal"]
    var selectedCategory = ["","",""]
        

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //do not want to segregate yet - maybe if we wish to implement a difficulty setting
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCategories.count //return the number of stories in the array
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath)
        let currentCat = arrayOfCatNames[indexPath.row] //current cell is current story
        // Configure the cell...
        cell.textLabel?.text = currentCat

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //perform a segue to the title page, sending the stories title along with it
        selectedCategory = arrayOfCategories[indexPath.row] //set the selected story so can be sent in the prepare for segue function beneath
        performSegue(withIdentifier: "segueToMatchUp", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sens the account instance to the main menu page
        if segue.identifier == "segueToMatchUp" {
            let sortView = segue.destination as! matchUp
            sortView.unshuffledQuestions = selectedCategory //send the selected story to the title page
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
