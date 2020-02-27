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
    
    
    
    
    let yellowButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        return button
    }()
    let blueButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        return button
    }()
    let redButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        return button
    }()
    
    
    override func loadView() {
        self.view = canvas //set the view controller view to be the canvas directly
    }
    
    fileprivate func setupStackView() { //sets up the stack view layout
        let stackView = UIStackView(arrangedSubviews : [ //programatically add the subviews into the stack view array (being the buttons created above)
            undoButton,
            yellowButton,
            blueButton,
            redButton,
            clearButton
            ])
        
        stackView.distribution = .fillEqually //programmatically ensure the distribution between the elements in the stack view are equal
            
        view.addSubview(stackView)
        //Adding programmatically the constraints for the stack view - anchoring it to the bottom left, bottom right and bottom
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo:
            view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:
            view.trailingAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        canvas.backgroundColor = .white //set canvas to white instead of black
        
        setupStackView() //call the function to set up the stack view
    
        
        
    }
}
