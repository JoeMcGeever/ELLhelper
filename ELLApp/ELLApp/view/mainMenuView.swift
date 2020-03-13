//
//  mainMenuView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 14/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//
import UIKit
import Foundation

class mainMenu : UIViewController {
    
    
    @IBOutlet weak var greetingLabel: UILabel!
    override func viewDidLoad() {
        self.view.addBackground(image: "Background")
        let defaults = UserDefaults.standard
        greetingLabel.text = ("Hello " + defaults.string(forKey: defaultsKeys.username)! + "!")
    }
    @IBAction func unwindToMainMenu(segue: UIStoryboardSegue) {} 
    
    
    @IBAction func logout(_ sender: Any) {
        //accountInstance.whoIsLoggedIn()
        let defaults = UserDefaults.standard
        defaults.set("", forKey: defaultsKeys.username)
        self.performSegue(withIdentifier: "logOutSegue", sender: self)
        
    }
    
}
    
    extension UIView { //programatically set the background
        func addBackground(image : String) {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
            
        imageViewBackground.image = UIImage(named: image)

            
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
        
}
    


