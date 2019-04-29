//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
  
    
  
    
    // MARK: - Outlets
    let calculating = Calculating()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculating.addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        
        calculating.plus()
        textView.text = calculating.updateDisplay()
        
    }

    @IBAction func minus() {
        
        calculating.minus()
        textView.text = calculating.updateDisplay()
    }

    @IBAction func equal() {
        calculating.calculateTotal()
        textView.text = calculating.calculateTotal()
    }
    
}


extension ViewController: warningHandler {
    func displayWarning(warning: String) {
        
    }
}

