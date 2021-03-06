//
//  drawNoun.swift
//  ELLApp
//
//  Created by Joseph McGeever on 27/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit



class DrawNoun : UIViewController {
    
    let wordCoreData = WordBank()
    
    let label = UILabel() //label for displaying the noun
    
    var noun : String? = nil
    var translation : String? = nil
    //this is to be overwitten by prior view
    
    let defaults = UserDefaults.standard
    
    
    let canvas = Canvas()
    
    let undoButton : UIButton = { //programatically add the undo button
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(undo), for: .touchUpInside) //programmatically add an action outlet for users pressing undo button, (do the code in objective c function "undo")
        return button
    }()
    
    @objc fileprivate func undo(){
        //need to remove the last line added to the lines array in the canvas class
        //so call the undo function in the canvas class
        canvas.undo()
    }
    
    let clearButton : UIButton = { //programatically add the clear button
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(clear), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func clear(){
        //call the clear function in canvas class
        canvas.clear()
    }
    
    let backButton : UIButton = { //programatically add the clear button
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func back(){
        //ask if sure, then segue backL
        let alert = UIAlertController(title: "Are you sure?", message: "All work will be lost", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            self.performSegue(withIdentifier: "unwindSegueToWordBank", sender: self)
          }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("User cancels")
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    let yellowButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    let blueButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    let redButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    let greenButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    let orangeButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    let purpleButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    let blackButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colourChange), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func colourChange(button: UIButton) {
        canvas.setStrokeColour(colour : button.backgroundColor  ?? .red)
    }
    
    
    let slider: UISlider = { //configure slider for canvas to edit size of what I am drawing
        let slider = UISlider()
        slider.minimumValue = 1 //configure the range the slider uses
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc fileprivate func sliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    let confirmButton : UIButton = { //programatically add the undo button
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(confirm), for: .touchUpInside) //programmatically add an action outlet for users pressing undo button, (do the code in objective c function "undo")
        return button
    }()
    
    @objc fileprivate func confirm(){

        let alert = UIAlertController(title: "Are you sure?", message: "The image will be saved", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            let image = self.canvas.asImage() //saves the canvas view as an image using its extension which converts it into an UIimage

            
            let user = self.defaults.string(forKey: defaultsKeys.username)!
                   
            self.wordCoreData.saveImageToWord(user: user, word: self.noun!, image: image) //save this to core data
            
            self.performSegue(withIdentifier: "unwindSegueToWordBank", sender: self)
          }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("User cancels")
        }))
        present(alert, animated: true, completion: nil)
         
    }
    
    
    override func loadView() {
        self.view = canvas //set the view controller view to be the canvas directly
    }
    
    fileprivate func setupStackView() { //sets up the stack view layout
        
        setUpLabel()
        
        let coloursStackView = UIStackView(arrangedSubviews:
        [yellowButton, redButton, greenButton, blueButton, orangeButton, purpleButton, blackButton])
        coloursStackView.distribution = .fillEqually//programmatically ensure the distribution between the elements in the stack view are equal
        
        let stackView = UIStackView(arrangedSubviews : [ //programatically add the subviews into the stack view array (being the buttons created above)
            undoButton,
            clearButton,
            coloursStackView,
            label,
            slider,
            backButton,
            confirmButton
            ])
        
        stackView.spacing = 12 //work on spacing between stack view elements
        stackView.distribution = .fillEqually //programmatically ensure the distribution between the elements in the stack view are equal
            
        view.addSubview(stackView)
        //Adding programmatically the constraints for the stack view - anchoring it to the bottom left, bottom right and bottom
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo:
            view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:
            view.trailingAnchor, constant: -8).isActive = true //pushes the right side of the stack view -9 (as slider wast working)
        
        //label stack view here
        
    }
    
    
    func setUpLabel() {

        label.text = noun
        label.numberOfLines = 0
        label.tag = 1
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)

        label.backgroundColor = .cyan
        
        label.textAlignment = .center
        
        
        // enable user interaction on the label
        label.isUserInteractionEnabled = true


        // create the gesture recognizer
        let labelTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.doSomethingOnTap))
        
        label.addGestureRecognizer(labelTapGesture)
        
    }

    @objc func doSomethingOnTap() {
        if label.text == noun{
            label.text = translation
        } else {
            label.text = noun
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        canvas.backgroundColor = .white //set canvas to white instead of black
        
        setupStackView() //call the function to set up the stack view
        
        
    }
}
