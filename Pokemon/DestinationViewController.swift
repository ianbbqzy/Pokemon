//
//  DestinationViewController.swift
//  Pokemon
//
//  Created by Ian Lee on 8/9/16.
//  Copyright © 2016 Ian Lee. All rights reserved.
//

import UIKit

protocol DestinationViewDelegate {
    func setText(text: String, index: Int)
}

class DestinationViewController: UIViewController {
        
    var LabelText = String()
    var index = 1
    var delegate : DestinationViewDelegate! = nil
    
    @IBOutlet var destinationLabel: UITextView!
    
    @IBAction func saveText(sender: UIButton) {

        delegate.setText(destinationLabel.text, index: index)
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }



    
    override func viewDidLoad() {        
        // Set the color text to the value passed in from
        // the segue
        
        destinationLabel.text = LabelText
    }
    
}