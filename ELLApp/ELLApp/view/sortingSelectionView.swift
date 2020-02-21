//
//  sortingSelectionView.swift
//  ELLApp
//
//  Created by Joseph McGeever on 19/02/2020.
//  Copyright © 2020 Joseph McGeever. All rights reserved.
//

import Foundation
import UIKit

class sortingSelection : UIViewController {
    var imageArray : [UIImage] = []
    let questionMarkImage : UIImage = UIImage(named: "questionmark")!
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    
    override func viewDidLoad() {
        image1.image = imageArray[0]
        image2.image = imageArray[1]
        image3.image = imageArray[2]
        image4.image = imageArray[3]
        image5.image = imageArray[4]
        image6.image = imageArray[5]
        image7.image = imageArray[6]
        image8.image = imageArray[7]
        image9.image = imageArray[8]
    }
    
    func chosenImage(imageNumber : Int) {
        //replace the image with the
    }
    
    @IBAction func press1(_ sender: Any) {
        //send 0
    }
    
    @IBAction func press2(_ sender: Any) {
        
    }
    
    @IBAction func press3(_ sender: Any) {
        
    }
    
    @IBAction func press4(_ sender: Any) {
        
    }
    
    @IBAction func press5(_ sender: Any) {
        
    }
    
    @IBAction func press6(_ sender: Any) {
        
    }
    
    @IBAction func press7(_ sender: Any) {
        
    }
    
    @IBAction func press8(_ sender: Any) {
        
    }
    
    @IBAction func press9(_ sender: Any) {
        
    }
    
}
