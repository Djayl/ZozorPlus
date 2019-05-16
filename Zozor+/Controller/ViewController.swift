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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculating.warningHandlerDelegate = self
    }
    
    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                textView.text = calculating.addNewNumber(i)
            }
        }
    }
    
    @IBAction func plus() {
        textView.text = calculating.plus()
    }
    
    @IBAction func minus() {
        textView.text = calculating.minus()
    }
    
    @IBAction func equal() {
        textView.text = calculating.calculateTotal()
    }
    
    @IBAction func squareRoot() {
        textView.text = calculating.squareRoot()
        
    }
    
}

extension ViewController: WarningHandler {
    func displayWarning(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
        
    }
}

