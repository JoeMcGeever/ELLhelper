//
//  drawNounCanvas.swift
//  ELLApp
//
//  Created by Joseph McGeever on 27/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit


class Canvas : UIView { //fileprivate ensures exteral classes cannot access these components
    
    fileprivate var strokeColour = UIColor.red
    fileprivate var strokeWidth: Float = 1
    
    func setStrokeWidth(width : Float) {
        self.strokeWidth = width
    }
    
    func setStrokeColour(colour : UIColor) {
        self.strokeColour = colour
    }
    
    fileprivate var lines : [Line] = [] //array of Line struct (from lineModelForDraw)
    
    func undo(){
        //remove the last entry to the array of lines
        _ = lines.popLast() //remove the last line from the array
        //used _ as we do not use the _ value
        setNeedsDisplay() //redraw the canvas with the lines array, now that the previous line has been popped off
    }
    
    func clear() {
        lines.removeAll() // remove all of the array
        setNeedsDisplay()
    }
    
    override func draw(_ rect : CGRect) {
        //custom drawing
        
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        
        
         
        lines.forEach { (line) in //execute this logic for each line in the array:
            //change the color and the line width:
            context.setStrokeColor(line.colour.cgColor) //need to say: cgColor as everything is in the context of core graphics with cg stands for -> strokeColour is a variable created at the top
            context.setLineWidth(CGFloat(line.strokeWidth)) //use the valueof strokewidth variable
            context.setLineCap(.round) //rounds off the end of the line to simulate a paint stroke
            for(i, p) in line.points.enumerated() { //because we want access to the index (i) and p (every poit in the line --> line is defined below as an array or CGPoints
                if i == 0 { //first point of the line
                    context.move(to: p)
                } else {
                    context.addLine(to: p)//draw to this point
                }
                
            }
             context.strokePath() //allows simple lines ot be drawn on the context
            
        }
    
        
        
    
        
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, colour: strokeColour, points: [])) // add a brand new line to the lines array
    }
    
    //need to track the finger as it traverses the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        //dont want to mess with optional values so I use a guard let to get the non-optional object out
        
        //point contains the point where the user touches
        
        //so as the finger moves, we access the last line we appended and we are appending points onto that line
        
        guard var lastLine = lines.popLast() else {return} //pop the last line drawn from the array of lines (pop so we can access the same referencing value as that in the array) -- so correct, updated line is being appended back onto the array
        
        lastLine.points.append(point) //append the recently drawn point
        lines.append(lastLine) //and append it back onto the array -
        setNeedsDisplay() //rewrite itself -> needs the canvas to be redrawn
        //once the line has been correctly updated due to the user drawing it, we call setNeedsDisplay to redraw all of the lines, including the one we have appended
        
    }
    
    
}
extension UIView { //extension to convert the work into an UIImage
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
